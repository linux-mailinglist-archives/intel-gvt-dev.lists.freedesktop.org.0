Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB0C19E438
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  4 Apr 2020 11:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DE06E0E9;
	Sat,  4 Apr 2020 09:41:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A816E0E7;
 Sat,  4 Apr 2020 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=AqMtuIfKhyb9qBOeLF2ngCbDbTkgWPlfw5hjLkqb7k0=; b=V91+pfIB+e0EjxYrdGBz6mZLeU
 b6sl/kba8YztMoKxFixyGrWr2+p6+TfA0D2AjbbjkY2bZIGjyOrkiEGXkydG/usWfjQAgQeph03/p
 IWY4AL97ClQJOz6TWS+xW7Q5iK9baeejsY4mWXxok+AnXwWf653d3wli0gWSTPPlZ6KaOgRSwSOl5
 ZU06lYY6VKTEueQ24UaKOf1HYDEX1xNZgSOexOSURxirYAwMPmyD5kygFhpOgyfR/W1FL0cGLBzUE
 0gBw5EZWuSLQPZ/XjtACPARRjtV8sgcPjEmiku93dzKae7Y9qUh6wCDy895raR0m7+CLsUAZ0uQnk
 j8K7x5+A==;
Received: from [2001:4bb8:180:7914:2ca6:9476:bbfa:a4d0] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKfIo-0002e8-4W; Sat, 04 Apr 2020 09:41:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 6/6] kernel: set USER_DS in kthread_use_mm
Date: Sat,  4 Apr 2020 11:41:01 +0200
Message-Id: <20200404094101.672954-7-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200404094101.672954-1-hch@lst.de>
References: <20200404094101.672954-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 amd-gfx@lists.freedesktop.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-usb@vger.kernel.org,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 intel-gvt-dev@lists.freedesktop.org, Jason Wang <jasowang@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Some architectures like arm64 and s390 require USER_DS to be set for
kernel threads to access user address space, which is the whole purpose
of kthread_use_mm, but other like x86 don't.  That has lead to a huge
mess where some callers are fixed up once they are tested on said
architectures, while others linger around and yet other like io_uring
try to do "clever" optimizations for what usually is just a trivial
asignment to a member in the thread_struct for most architectures.

Make kthread_use_mm set USER_DS, and kthread_unuse_mm restore to the
previous value instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/usb/gadget/function/f_fs.c | 4 ----
 drivers/vhost/vhost.c              | 3 ---
 fs/io-wq.c                         | 8 ++------
 fs/io_uring.c                      | 4 ----
 kernel/kthread.c                   | 6 ++++++
 5 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index d9e48bd7c692..a1198f4c527c 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -824,13 +824,9 @@ static void ffs_user_copy_worker(struct work_struct *work)
 	bool kiocb_has_eventfd = io_data->kiocb->ki_flags & IOCB_EVENTFD;
 
 	if (io_data->read && ret > 0) {
-		mm_segment_t oldfs = get_fs();
-
-		set_fs(USER_DS);
 		kthread_use_mm(io_data->mm);
 		ret = ffs_copy_to_iter(io_data->buf, ret, &io_data->data);
 		kthread_unuse_mm(io_data->mm);
-		set_fs(oldfs);
 	}
 
 	io_data->kiocb->ki_complete(io_data->kiocb, ret, ret);
diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 1787d426a956..b5229ae01d3b 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -333,9 +333,7 @@ static int vhost_worker(void *data)
 	struct vhost_dev *dev = data;
 	struct vhost_work *work, *work_next;
 	struct llist_node *node;
-	mm_segment_t oldfs = get_fs();
 
-	set_fs(USER_DS);
 	kthread_use_mm(dev->mm);
 
 	for (;;) {
@@ -365,7 +363,6 @@ static int vhost_worker(void *data)
 		}
 	}
 	kthread_unuse_mm(dev->mm);
-	set_fs(oldfs);
 	return 0;
 }
 
diff --git a/fs/io-wq.c b/fs/io-wq.c
index 83c2868eff2a..75cc2f31816d 100644
--- a/fs/io-wq.c
+++ b/fs/io-wq.c
@@ -168,7 +168,6 @@ static bool __io_worker_unuse(struct io_wqe *wqe, struct io_worker *worker)
 			dropped_lock = true;
 		}
 		__set_current_state(TASK_RUNNING);
-		set_fs(KERNEL_DS);
 		kthread_unuse_mm(worker->mm);
 		mmput(worker->mm);
 		worker->mm = NULL;
@@ -420,14 +419,11 @@ static void io_wq_switch_mm(struct io_worker *worker, struct io_wq_work *work)
 		mmput(worker->mm);
 		worker->mm = NULL;
 	}
-	if (!work->mm) {
-		set_fs(KERNEL_DS);
+	if (!work->mm)
 		return;
-	}
+
 	if (mmget_not_zero(work->mm)) {
 		kthread_use_mm(work->mm);
-		if (!worker->mm)
-			set_fs(USER_DS);
 		worker->mm = work->mm;
 		/* hang on to this mm */
 		work->mm = NULL;
diff --git a/fs/io_uring.c b/fs/io_uring.c
index 367406381044..c332a34e8b34 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -5871,15 +5871,12 @@ static int io_sq_thread(void *data)
 	struct io_ring_ctx *ctx = data;
 	struct mm_struct *cur_mm = NULL;
 	const struct cred *old_cred;
-	mm_segment_t old_fs;
 	DEFINE_WAIT(wait);
 	unsigned long timeout;
 	int ret = 0;
 
 	complete(&ctx->completions[1]);
 
-	old_fs = get_fs();
-	set_fs(USER_DS);
 	old_cred = override_creds(ctx->creds);
 
 	timeout = jiffies + ctx->sq_thread_idle;
@@ -5985,7 +5982,6 @@ static int io_sq_thread(void *data)
 	if (current->task_works)
 		task_work_run();
 
-	set_fs(old_fs);
 	if (cur_mm) {
 		kthread_unuse_mm(cur_mm);
 		mmput(cur_mm);
diff --git a/kernel/kthread.c b/kernel/kthread.c
index 316db17f6b4f..9e27d01b6d78 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -52,6 +52,7 @@ struct kthread {
 	unsigned long flags;
 	unsigned int cpu;
 	void *data;
+	mm_segment_t oldfs;
 	struct completion parked;
 	struct completion exited;
 #ifdef CONFIG_BLK_CGROUP
@@ -1235,6 +1236,9 @@ void kthread_use_mm(struct mm_struct *mm)
 
 	if (active_mm != mm)
 		mmdrop(active_mm);
+
+	to_kthread(tsk)->oldfs = get_fs();
+	set_fs(USER_DS);
 }
 EXPORT_SYMBOL_GPL(kthread_use_mm);
 
@@ -1249,6 +1253,8 @@ void kthread_unuse_mm(struct mm_struct *mm)
 	WARN_ON_ONCE(!(tsk->flags & PF_KTHREAD));
 	WARN_ON_ONCE(!tsk->mm);
 
+	set_fs(to_kthread(tsk)->oldfs);
+
 	task_lock(tsk);
 	sync_mm_rss(mm);
 	tsk->mm = NULL;
-- 
2.25.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
