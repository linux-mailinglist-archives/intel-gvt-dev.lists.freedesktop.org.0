Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B232923DB4D
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  6 Aug 2020 17:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A9F6E8C8;
	Thu,  6 Aug 2020 15:17:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72FE6E8C3;
 Thu,  6 Aug 2020 15:17:43 +0000 (UTC)
IronPort-SDR: ZcYd6qlj1IPpZKD/4xmLKIW8q1yL8ZLflP3ELpSHcknMJ1Jm3EYfRALTRC+o8Nk89DiG+aot5h
 +7o7RHZRww8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="132380097"
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; d="scan'208";a="132380097"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 08:17:41 -0700
IronPort-SDR: pTymMt1Etsd3G25kDcAqp+JN4iCuBMauOSePcp4gengtmjXrNswMBLbj9kFIVgRdy7G2FdGJFQ
 GZhe5iqtEGWA==
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; d="scan'208";a="467876716"
Received: from ichiojdo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.169])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 08:17:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-next-fixes
In-Reply-To: <20200805080207.GY27035@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200805080207.GY27035@zhen-hp.sh.intel.com>
Date: Thu, 06 Aug 2020 18:17:35 +0300
Message-ID: <874kpfkdm8.fsf@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 05 Aug 2020, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> Hi,
>
> Here's to only include gvt fixes for 5.9-rc1. Two fixes to make
> guest suspend/resume working gracefully are included.

Pulled, thanks.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
