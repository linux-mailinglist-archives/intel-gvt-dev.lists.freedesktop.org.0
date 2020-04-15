Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830541A91B6
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Apr 2020 06:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942E889919;
	Wed, 15 Apr 2020 04:06:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEB16E834
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Apr 2020 04:06:18 +0000 (UTC)
IronPort-SDR: JrD/4MLbezxXKpUZNTRqpNprJt8UlT6pG33XbSnznzWvRQl6Xs/5rmoEru0hxoJd4pxIDF/O9R
 UR0N3OGGNjgg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 21:06:18 -0700
IronPort-SDR: UgCXjU1fMME7EbmCfRQd4u13F6eSn/FWWhzIGEGYmV3vgfcWertN/rrXy+cOq5KF5L3xvwnuur
 klGndBQ0QsGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,385,1580803200"; d="scan'208";a="427299794"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by orsmga005.jf.intel.com with ESMTP; 14 Apr 2020 21:06:16 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 0/2]  optimization on shadow ctx population and updating
Date: Tue, 14 Apr 2020 23:56:33 -0400
Message-Id: <20200415035633.26373-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

patch 1 removes repeatedly calling to kmap()/kunmap() for accessing shadow
ctx pages. Instead, it accesses the pages through its base virtual
address.

patch 2 combines guest ctx pages access if the guest context pages are
found to be contiguous in IOVA.

with the two patches,
average cycles for populate_shadow_context() and update_guest_context()
are reduced by ~10000-20000 cycles, depending on the average number of
consecutive pages in each read/write.

(1) comparison of cycles of
populate_shadow_context() + update_guest_context() when executing
different benchmarks
 -------------------------------------------------------------
|       cycles      | glmark2     | lightsmark  | openarena   |
|-------------------------------------------------------------|
| before this patch | 65968       | 97852       | 61373       |
|  after this patch | 56017 (85%) | 73862 (75%) | 47463 (77%) |
 -------------------------------------------------------------

(2) average count of pages read/written a time in
populate_shadow_context() and update_guest_context()
for each benchmark

 -----------------------------------------------------------
|     page cnt      | glmark2     | lightsmark  | openarena |
|-----------------------------------------------------------|
| before this patch |    1        |      1      |    1      |
|  after this patch |    5.25     |     19.99   |   20      |
 ------------------------------------------------------------

(3) comparison of benchmarks scores
 ---------------------------------------------------------------------
|      score        | glmark2       | lightsmark     | openarena      |
|---------------------------------------------------------------------|
| before this patch | 1244          | 222.18         | 114.4          |
|  after this patch | 1248 (100.3%) | 225.8 (101.6%) | 115.0 (100.9%) |
 ---------------------------------------------------------------------
 
Yan Zhao (2):
  drm/i915/gvt: access shadow ctx via its virtual address directly
  drm/i915/gvt: combine access to consecutive guest context pages

 drivers/gpu/drm/i915/gvt/scheduler.c | 93 +++++++++++++++++++---------
 1 file changed, 65 insertions(+), 28 deletions(-)

-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
