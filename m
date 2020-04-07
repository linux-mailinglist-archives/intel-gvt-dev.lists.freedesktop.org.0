Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5941A0EAC
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Apr 2020 15:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8E56E885;
	Tue,  7 Apr 2020 13:53:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4160D6E887;
 Tue,  7 Apr 2020 13:53:26 +0000 (UTC)
IronPort-SDR: NQySUVHT36gblCj1po24BLgk246HUQUXCLjvZ4aBz2yUYx/ZWnBSeW0y2m6Lb1xxq7B6j5iuIu
 SWJ2Csp/F2SA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 06:53:25 -0700
IronPort-SDR: 5g18Bf4c6jossTx9xm8ozhK5EJOwo7QrEUUw81uEGwcQJ4xeJ3rINMxkO14+a3rnNGq3vGw+L8
 /QLg5XPorELA==
X-IronPort-AV: E=Sophos;i="5.72,354,1580803200"; d="scan'208";a="424754819"
Received: from vogtstef-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.249.40.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 06:53:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-next-fixes
In-Reply-To: <20200407133559.GB4170610@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200331070025.GB16629@zhen-hp.sh.intel.com>
 <20200331162644.GA3779315@intel.com>
 <20200403030507.GQ16629@zhen-hp.sh.intel.com>
 <20200403175033.GA3997092@intel.com>
 <20200407080256.GU16629@zhen-hp.sh.intel.com>
 <20200407133559.GB4170610@intel.com>
Date: Tue, 07 Apr 2020 16:53:19 +0300
Message-ID: <87wo6rier4.fsf@intel.com>
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
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Yuan, 
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 07 Apr 2020, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Tue, Apr 07, 2020 at 04:02:56PM +0800, Zhenyu Wang wrote:
>> On 2020.04.03 10:50:33 -0700, Rodrigo Vivi wrote:
>> > 
>> > +Dave and Daniel,
>> > 
>> > > 
>> > > I forgot to mention one thing for 5.7. We've fixed to change guest mem r/w
>> > > from KVM to use new VFIO dma r/w instead in this series: https://patchwork.freedesktop.org/series/72038/
>> > > 
>> > > As this depends on VFIO tree and looks VFIO pull for 5.7 is not settled down
>> > > yet, we'd need to backmerge and send pull against vfio merge for 5.7.
>> > 
>> > I'm not sure if I'm following on which backmerge you are willing
>> > us to do here. And for me it looks like late for 5.7 already.
>> > 
>> > Maybe you mean we ack all of this to go through vfio flow
>> > then once that is settled drm backmerge and then drm-intel backmerge
>> > and you backmerge...
>> > 
>> > Is that what you want?
>> > 
>> 
>> My purpose is to get GVT side fixes of guest memory r/w through new
>> vfio dma r/w interface in 5.7. As vfio 5.7-rc1 pull has already been
>> merged in linus master, looks just want drm-intel backmerge now then
>> could send gvt side fixes. Ok for you?
>
> I'm afraid it is too late for that. That would depend on backmerge
> of drm itself as well... And we are in a point that we are about to
> move from drm-next to drm-fixes.

*If* they're fixes, drm-intel-fixes rebases on v5.7-rc1 or -rc2, and if
they can send a gvt fixes pull based on that, it could work out.

BR,
Jani.


>
> Also looking to the patches itself they look more content for -next
> than -fixes and our window with drm closed on -rc6
>
> So it looks to me that this will have to wait for the 5.8.
>
> One good suggestion I heard from Daniel for cases like this in the
> future is the use of topic branches so things don't get spread into
> multiple versions like this.
>
>> 
>> Sorry for late reply, I was out for a short vacation.
>
> Sorry for not been able to help further here
>
> Thanks,
> Rodrigo.
>
>> 
>> Thanks
>> 
>> -- 
>> Open Source Technology Center, Intel ltd.
>> 
>> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
>
>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
