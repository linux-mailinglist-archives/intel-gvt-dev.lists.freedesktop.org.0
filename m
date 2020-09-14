Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE3226950F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 14 Sep 2020 20:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCFA6E532;
	Mon, 14 Sep 2020 18:39:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778A56E526;
 Mon, 14 Sep 2020 18:39:26 +0000 (UTC)
IronPort-SDR: /4ng62r8mG97HypY+yTfrUDFbUsWkDBdinXpyXvgck/evvwOAAd+9p1iIZ1q5hpeH0i3pDs4q4
 tKMyHsLAoPog==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="146880264"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="146880264"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 11:39:23 -0700
IronPort-SDR: eZMVtAOFh5EAVGzLC8qvQBDYg6/jYF7naChQAENrur+TOBG604NH+pyTGRXucHoyS0WWJ88HzP
 p7SIjTwVngAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="507245356"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by fmsmga005.fm.intel.com with ESMTP; 14 Sep 2020 11:39:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Sep 2020 19:39:20 +0100
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Mon, 14 Sep 2020 11:39:19 -0700
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-next
Thread-Topic: [PULL] gvt-next
Thread-Index: AQHWikJG2dCytxLA3EuhPiHA+Hje3qlo7YkA
Date: Mon, 14 Sep 2020 18:39:19 +0000
Message-ID: <7E56BF0B-0E18-44D4-A332-0812A591F087@intel.com>
References: <20200910053720.GK28614@zhen-hp.sh.intel.com>
 <20200911235825.GA259925@intel.com>
 <20200914023420.GY28614@zhen-hp.sh.intel.com>
In-Reply-To: <20200914023420.GY28614@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-ID: <0631D00198C3FB41A8DEA4917880C7CE@intel.com>
MIME-Version: 1.0
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "dim-tools@lits.freedesktop.org" <dim-tools@lits.freedesktop.org>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



> On Sep 13, 2020, at 7:34 PM, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> 
> On 2020.09.11 19:58:25 -0400, Rodrigo Vivi wrote:
>> On Thu, Sep 10, 2020 at 01:37:20PM +0800, Zhenyu Wang wrote:
>>> 
>>> Hi,
>>> 
>>> As we split pull request for 5.10 this time, here's gvt-next pull
>>> for 5.10. For gvt ww lock fix, Zhi would send another pull based
>>> on gem-next.
>>> 
>>> This includes current command access flag cleanup for
>>> handlers which would be used for next refined cmd scan. And also
>>> two more recent fixes on workaround cmd access and MIA reset state.
>>> 
>>> Thanks
>>> --
>>> The following changes since commit ced026e959bec5046afa310d6474e147b6294da2:
>>> 
>>>  drm/i915: Update DRIVER_DATE to 20200824 (2020-08-24 14:26:38 -0400)
>>> 
>>> are available in the Git repository at:
>>> 
>>>  https://github.com/intel/gvt-linux tags/gvt-next-2020-09-10
>> 
>> This is a malformed pull request line which dim doesn't recognize.
>> Could you please regenerate it?
>> 
>> $ cat /tmp/gvt-next/cur/1599868544.259925_1.rdvivi-losangeles\:2\,S | dim apply-pull drm-intel-next-queued
>> dim: no pull request found
>> 
> 
> Hmm, strange, it pulls fine here when I tried this in local. I just copied in mutt and
>     cat /tmp/gvt-next.0910 | ./dim apply-pull drm-intel-next-queued

sorry... it was dim's fault ;)

dim now accepts python3, but a function used on email parser doesn't work in
the same way...

pulled now, thanks

> 
>>> 
>>> for you to fetch changes up to df398e33b8fd3ac28b3c7166de555e38d26e7391:
>>> 
>>>  drm/i915/gvt: Init vreg GUC_STATUS to GS_MIA_IN_RESET (2020-09-10 13:49:05 +0800)
>>> 
>>> ----------------------------------------------------------------
>>> gvt-next-2020-09-10
>>> 
>>> - Cleanup command access flag (Yan)
>>> - New workaround cmd access fix (Colin)
>>> - MIA reset state fix (Colin)
>>> 
>>> ----------------------------------------------------------------
>>> Colin Xu (2):
>>>      drm/i915/gvt: Add F_CMD_ACCESS for some GEN9 SKU WA MMIO access
>>>      drm/i915/gvt: Init vreg GUC_STATUS to GS_MIA_IN_RESET
>>> 
>>> Yan Zhao (4):
>>>      drm/i915/gvt: rename F_IN_CTX flag to F_SR_IN_CTX
>>>      drm/i915/gvt: remove flag F_CMD_ACCESSED
>>>      drm/i915/gvt: add/modify interfaces for flag F_CMD_ACCESS
>>>      drm/i915/gvt: remove F_CMD_ACCESS flag for some registers
>>> 
>>> drivers/gpu/drm/i915/gvt/cmd_parser.c   |  6 ++---
>>> drivers/gpu/drm/i915/gvt/gvt.h          | 44 +++++++++++++++++++--------------
>>> drivers/gpu/drm/i915/gvt/handlers.c     | 32 +++++++++++++-----------
>>> drivers/gpu/drm/i915/gvt/mmio.c         |  3 +++
>>> drivers/gpu/drm/i915/gvt/mmio_context.c |  2 +-
>>> 5 files changed, 49 insertions(+), 38 deletions(-)
>>> 
>>> -- 
>>> 
>>> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
>> 
>> 
>> _______________________________________________
>> intel-gvt-dev mailing list
>> intel-gvt-dev@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> 
> -- 
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
