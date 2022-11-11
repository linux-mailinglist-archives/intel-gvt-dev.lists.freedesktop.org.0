Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F56625759
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 10:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AF310E7E3;
	Fri, 11 Nov 2022 09:55:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3983F10E7DF;
 Fri, 11 Nov 2022 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668160515; x=1699696515;
 h=from:to:cc:subject:date:message-id;
 bh=GJYrYNUtpEQsFbSwvNRlRAKIkv76R0GmUW9rcH9SpOA=;
 b=YzOdIChvvlseMqCDnr7cmZIkpuRgmwbiCJm9GvAiPteKTwUKkIX3A4Zp
 KJQeQJqIDBAjUfTad4vTWBhhdqJZUn5WNmDvtUd4GA1nnAaoetjltOilu
 mV0DbZJOGzt4y5C+OM8ksXn6LtxN6QZtdQRwzebVvHavfyw2KV3XqlGyW
 IIRj0Tz51anLfLUs/1qcvYSmYjDVUZKpOfNwhOoIJa41rhPrysOpkXwt9
 3Tr6R3g2VazndeTCsGFlFYDUkQ9hCTV7EYOAJ1w4gFokPCTQv9eteEEc3
 GwTHtuQbY+gHbJCMgiyDHBQyKRZk+u3zZicuLYSFQMOU6GYQERVTYVGz6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="294927473"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="294927473"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 01:55:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="701165687"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="701165687"
Received: from yzhao56-desk.sh.intel.com ([10.238.200.254])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 01:55:12 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 0/3] add track_remove_slot and remove track_flush_slot
Date: Fri, 11 Nov 2022 17:32:22 +0800
Message-Id: <20221111093222.3148-1-yan.y.zhao@intel.com>
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
Cc: pbonzini@redhat.com, Yan Zhao <yan.y.zhao@intel.com>,
 zhenyuw@linux.intel.com, seanjc@google.com
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

