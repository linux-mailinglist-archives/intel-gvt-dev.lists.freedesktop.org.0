Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3B53D2735
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 22 Jul 2021 18:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B696E9DD;
	Thu, 22 Jul 2021 16:04:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181996E9DD;
 Thu, 22 Jul 2021 16:04:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="211681960"
X-IronPort-AV: E=Sophos;i="5.84,261,1620716400"; d="scan'208";a="211681960"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 09:03:51 -0700
X-IronPort-AV: E=Sophos;i="5.84,261,1620716400"; d="scan'208";a="433351211"
Received: from mtwomey-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.167.4])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 09:03:51 -0700
Date: Thu, 22 Jul 2021 09:03:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [Intel-gfx] 5.14-rc2 warnings with kvmgvt
Message-ID: <20210722160345.xi5krc5truc65t5y@ldmartin-desk2>
References: <YPgAuSt6Ps7w4/AI@infradead.org> <YPgD/8Y3/te/Hsu3@intel.com>
 <YPhApJo1o6yBYUh2@infradead.org> <YPiGI9tzLzGZg47j@infradead.org>
 <YPiPGv/wtnjsxSZy@intel.com> <YPjy/sYgy1SvZBD+@infradead.org>
 <20210722055523.e5tdgcledznyzmxt@ldmartin-desk2>
 <YPkcQqnRGZABpmce@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPkcQqnRGZABpmce@infradead.org>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 08:20:34AM +0100, Christoph Hellwig wrote:
>On Thu, Jul 22, 2021 at 01:55:23AM -0400, Lucas De Marchi wrote:
>> humn... PORT_F. KBL doesn't have PORT_F. We decided to keep the handling
>> of DISPLAY_VER == 10 and DISPLAY_VER == 9 together and trust the VBT,
>> but when the VBT is not present, DDI F will get added unconditio.
>>
>> maybe best thing to do is to split that
>
>With this and the previous patch the stack traces are gone.

maybe not the perfect fix though... can you share how you're starting
qemu so I can try to reproduce it? I'd like to see a log with
drm.debug=0xe param.

In theory 5a9d38b20a5a ("drm/i915/display: hide workaround for broken vbt in intel_bios.c")
should filter out the PORT_F in KBL.


thanks
Lucas De Marchi
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
