Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB551355C5
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 Jan 2020 10:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF7F6E8EF;
	Thu,  9 Jan 2020 09:29:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352056E8EB;
 Thu,  9 Jan 2020 09:29:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 01:29:07 -0800
X-IronPort-AV: E=Sophos;i="5.69,413,1571727600"; d="scan'208";a="216242055"
Received: from vmastnak-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.252.37.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 01:29:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/i915/gvt: make gvt oblivious of kvmgt data
 structures
In-Reply-To: <5e98e9666bfeb275ec168df24bb8e9a33781229e.camel@cyberus-technology.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200106140622.14393-1-julian.stecklina@cyberus-technology.de>
 <20200106140622.14393-2-julian.stecklina@cyberus-technology.de>
 <87tv56qm9m.fsf@intel.com>
 <5e98e9666bfeb275ec168df24bb8e9a33781229e.camel@cyberus-technology.de>
Date: Thu, 09 Jan 2020 11:29:22 +0200
Message-ID: <87zhexj7v1.fsf@intel.com>
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
Cc: zhiyuan.lv@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hang.yuan@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 08 Jan 2020, Julian Stecklina <julian.stecklina@cyberus-technology.de> wrote:
> On Wed, 2020-01-08 at 12:24 +0200, Jani Nikula wrote:
>> On Mon, 06 Jan 2020, Julian Stecklina <julian.stecklina@cyberus-technology.de>
>> wrote:
> [...]
>> > +	/* Hypervisor-specific device state. */
>> > +	void *vdev;
>> 
>> I have no clue about the relative merits of the patch, but you can use
>> the actual type for the pointer with a forward declaration. You don't
>> need the definition for that.
>> 
>> i.e.
>> 
>> struct kvmgt_vdev;
>> ...
>> 	struct kvmgt_vdev *vdev;
>
> The goal here is to make the GVT code independent of the hypervisor backend.
> Different hypervisor backends need to keep different per-device state, so using
> the KVM type here defeats the purpose.
>
> I assume this is not only useful for us, but also for other hypervisor backends,
> such as Xen or 3rd-party hypervisors.

Right, carry on, sorry for the noise. ;)

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
