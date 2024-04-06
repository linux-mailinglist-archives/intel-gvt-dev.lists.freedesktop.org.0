Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E421689AB3C
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  6 Apr 2024 16:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A8210F078;
	Sat,  6 Apr 2024 14:02:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088DD10F16D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  6 Apr 2024 14:02:25 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id 71931100DA1BC;
 Sat,  6 Apr 2024 15:53:04 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 483384E2B1B; Sat,  6 Apr 2024 15:53:04 +0200 (CEST)
Message-Id: <5ed62b197a442ec6db53d8746d9d806dd0576e2d.1712410202.git.lukas@wunner.de>
In-Reply-To: <cover.1712410202.git.lukas@wunner.de>
References: <cover.1712410202.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sat, 6 Apr 2024 15:52:01 +0200
Subject: [PATCH 1/2] sysfs: Add sysfs_bin_attr_simple_read() helper
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-acpi@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 intel-gvt-dev@lists.freedesktop.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

When drivers expose a bin_attribute in sysfs which is backed by a buffer
in memory, a common pattern is to set the @private and @size members in
struct bin_attribute to the buffer's location and size.

The ->read() callback then merely consists of a single memcpy() call.
It's not even necessary to perform bounds checks as these are already
handled by sysfs_kf_bin_read().

However each driver is so far providing its own ->read() implementation.
The pattern is sufficiently frequent to merit a public helper, so add
sysfs_bin_attr_simple_read() as well as BIN_ATTR_SIMPLE_RO() and
BIN_ATTR_SIMPLE_ADMIN_RO() macros to ease declaration of such
bin_attributes and reduce LoC and .text section size.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 fs/sysfs/file.c       | 27 +++++++++++++++++++++++++++
 include/linux/sysfs.h | 15 +++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index 6b7652f..289b57d 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -783,3 +783,30 @@ int sysfs_emit_at(char *buf, int at, const char *fmt, ...)
 	return len;
 }
 EXPORT_SYMBOL_GPL(sysfs_emit_at);
+
+/**
+ *	sysfs_bin_attr_simple_read - read callback to simply copy from memory.
+ *	@file:	attribute file which is being read.
+ *	@kobj:	object to which the attribute belongs.
+ *	@attr:	attribute descriptor.
+ *	@buf:	destination buffer.
+ *	@off:	offset in bytes from which to read.
+ *	@count:	maximum number of bytes to read.
+ *
+ * Simple ->read() callback for bin_attributes backed by a buffer in memory.
+ * The @private and @size members in struct bin_attribute must be set to the
+ * buffer's location and size before the bin_attribute is created in sysfs.
+ *
+ * Bounds check for @off and @count is done in sysfs_kf_bin_read().
+ * Negative value check for @off is done in vfs_setpos() and default_llseek().
+ *
+ * Returns number of bytes written to @buf.
+ */
+ssize_t sysfs_bin_attr_simple_read(struct file *file, struct kobject *kobj,
+				   struct bin_attribute *attr, char *buf,
+				   loff_t off, size_t count)
+{
+	memcpy(buf, attr->private + off, count);
+	return count;
+}
+EXPORT_SYMBOL_GPL(sysfs_bin_attr_simple_read);
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 326341c..a7d725f 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -371,6 +371,17 @@ struct bin_attribute bin_attr_##_name = __BIN_ATTR_ADMIN_RO(_name, _size)
 #define BIN_ATTR_ADMIN_RW(_name, _size)					\
 struct bin_attribute bin_attr_##_name = __BIN_ATTR_ADMIN_RW(_name, _size)
 
+#define __BIN_ATTR_SIMPLE_RO(_name, _mode) {				\
+	.attr	= { .name = __stringify(_name), .mode = _mode },	\
+	.read	= sysfs_bin_attr_simple_read,				\
+}
+
+#define BIN_ATTR_SIMPLE_RO(_name)					\
+struct bin_attribute bin_attr_##_name = __BIN_ATTR_SIMPLE_RO(_name, 0444)
+
+#define BIN_ATTR_SIMPLE_ADMIN_RO(_name)					\
+struct bin_attribute bin_attr_##_name = __BIN_ATTR_SIMPLE_RO(_name, 0400)
+
 struct sysfs_ops {
 	ssize_t	(*show)(struct kobject *, struct attribute *, char *);
 	ssize_t	(*store)(struct kobject *, struct attribute *, const char *, size_t);
@@ -478,6 +489,10 @@ int sysfs_group_change_owner(struct kobject *kobj,
 __printf(3, 4)
 int sysfs_emit_at(char *buf, int at, const char *fmt, ...);
 
+ssize_t sysfs_bin_attr_simple_read(struct file *file, struct kobject *kobj,
+				   struct bin_attribute *attr, char *buf,
+				   loff_t off, size_t count);
+
 #else /* CONFIG_SYSFS */
 
 static inline int sysfs_create_dir_ns(struct kobject *kobj, const void *ns)
-- 
2.43.0

