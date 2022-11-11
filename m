Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6802F6258E1
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 11:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE9110E7FE;
	Fri, 11 Nov 2022 10:55:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23B710E7ED;
 Fri, 11 Nov 2022 10:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668164149; x=1699700149;
 h=from:to:cc:subject:date:message-id;
 bh=O2g9ozphUY908mOhpsa+b7OyhsmdMF5WwXwnWaF1F/o=;
 b=Ykm04UUT+XHMJNapWJWasUgXTrlj+tUUWHgI4w8U1VjBpZYf4sxOCiQ0
 /S9fDsxZHc7mHSJIVHCypksTk2YcFu9HwzSsT1vMKZsVb3IGh4EPnlrEc
 RwCz5iQK55WJ74ZzgYIX7iU7kmHcaSAzQ3weN4oc7+/RFLwkCxQXwgNsR
 cqRZnSvEyf0duzQr/XDz7ht7imjJoNhTfIFKi4JKF5895wCI2RDAiiGKM
 9X6jPZfakdGGv6EfDY8HPINxCq2aWD0Y5Z7fCIijs/pxh/Jt27QOIOEpb
 DOFuBtmq2gl8UtLcSqVMb/CCo89P2ZurnfdkbWsleHx0dxGzFf6JEsoAb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="309202647"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="309202647"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:55:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="668779140"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="668779140"
Received: from yzhao56-desk.sh.intel.com ([10.238.200.254])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:55:46 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] add track_remove_slot and remove track_flush_slot
Date: Fri, 11 Nov 2022 18:32:47 +0800
Message-Id: <20221111103247.22275-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, seanjc@google.com,
 intel-gfx@lists.freedesktop.org, zhenyuw@linux.intel.com, pbonzini@redhat.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This series is based on Sean's series
https://lore.kernel.org/all/20221110014821.1548347-1-seanjc@google.com/,
which allows KVM internal user of page track not to rely on the page track
hook .track_flush_slot.

Page track hook track_flush_slot is for notification of slot flush and
is called when a slot DELETE/MOVE is on-going.

Page track hook track_remove_slot is for notification of slot removal
and is called when the slot DELETE/MOVE has been committed.

As KVMGT, the only external user of page track, actually only cares about
when slot removal indeed happens, this series switches KVMGT to use the new
hook .track_remove_slot.
And as there are no users to .track_flush_slot any more, this hook is
removed.

v2:
Corrected wrong email address of Sean. sorry.
 
Yan Zhao (3):
  KVM: x86: add a new page track hook track_remove_slot
  drm/i915/gvt: switch from track_flush_slot to track_remove_slot
  KVM: x86: Remove the unused page track hook track_flush_slot

 arch/x86/include/asm/kvm_page_track.h | 8 ++++----
 arch/x86/kvm/mmu/page_track.c         | 8 ++++----
 arch/x86/kvm/x86.c                    | 5 +++--
 drivers/gpu/drm/i915/gvt/kvmgt.c      | 6 +++---
 4 files changed, 14 insertions(+), 13 deletions(-)

-- 
2.17.1

