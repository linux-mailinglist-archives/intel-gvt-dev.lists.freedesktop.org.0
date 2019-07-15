Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A5468402
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Jul 2019 09:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1911E89518;
	Mon, 15 Jul 2019 07:21:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D531889518
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 Jul 2019 07:21:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jul 2019 00:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,493,1557212400"; d="scan'208";a="175019394"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Jul 2019 00:21:13 -0700
Received: from fmsmsx157.amr.corp.intel.com (10.18.116.73) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 15 Jul 2019 00:21:12 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX157.amr.corp.intel.com (10.18.116.73) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 15 Jul 2019 00:21:12 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.3]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.22]) with mapi id 14.03.0439.000;
 Mon, 15 Jul 2019 15:21:10 +0800
From: "Lu, Kechen" <kechen.lu@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [RFC] Display Refresh Events Delivering Poc Combining Vblanks
 and Pageflips
Thread-Topic: [RFC] Display Refresh Events Delivering Poc Combining Vblanks
 and Pageflips
Thread-Index: AdU4jyNwuCeR2zqGQ3a4BwCnvXX/bgB6pi8AABTBEqA=
Date: Mon, 15 Jul 2019 07:21:09 +0000
Message-ID: <31185F57AF7C4B4F87C41E735C23A6FE64D184@shsmsx102.ccr.corp.intel.com>
References: <31185F57AF7C4B4F87C41E735C23A6FE64C87F@shsmsx102.ccr.corp.intel.com>
 <20190715032420.GC16681@zhen-hp.sh.intel.com>
In-Reply-To: <20190715032420.GC16681@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTJlYTQxM2MtZTllZi00MWM2LTk5NmQtMTc0NzU3MjgyZGJlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoib2J2VmRjZHJhVUduOWw5akErYWtKRks0NTVJUjdZc2ZFM2FYMWQ3ZldpOG4rdlB2TUxWeVJrZnR1Vm43S3dTbyJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: multipart/mixed;
 boundary="_002_31185F57AF7C4B4F87C41E735C23A6FE64D184shsmsx102ccrcorpi_"
MIME-Version: 1.0
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Zhang, Tina" <tina.zhang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--_002_31185F57AF7C4B4F87C41E735C23A6FE64D184shsmsx102ccrcorpi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,=20

> -----Original Message-----
> From: Zhenyu Wang [mailto:zhenyuw@linux.intel.com]
> Sent: Monday, July 15, 2019 11:24 AM
> To: Lu, Kechen <kechen.lu@intel.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>; intel-gvt-dev@lists.freedesktop.or=
g;
> Zhang, Tina <tina.zhang@intel.com>
> Subject: Re: [RFC] Display Refresh Events Delivering Poc Combining Vblank=
s and
> Pageflips
>=20
> On 2019.07.12 10:37:23 +0000, Lu, Kechen wrote:
> > Hi,
> >
> > As the discussions we have before about the vblank and pageflip events
> > shows that these two display event delivering favors have their own
> drawbacks, i.e.
> >
> >  1. vblanks would trigger 60 times per second constantly but sometimes =
cause
> >     extra and unnecessary handling and performance drops if no pageflip
> >     happens, though it can avoid overwhelmed events in such cases like =
moving
> >     the cursor frequently causing userspace window manager ui overhead
> > 2. pageflip events only would be embarrassing when happening to a singl=
e
> >     framebuffer like in Linux textmode console, almost no pageflips are
> >     triggered, as a consequence, the userspace does not refresh the dis=
play
> >     while framebuffer updates, thus user experience drops. Plus, just l=
ike the
> >     vblanks, if overwhelmed events deliver to userspace, the performanc=
e drops
> >     as well
> >
> >
> > These days we tried some ways to make tradeoff and take the advantage
> > of the both two favors. To be brief, the basic idea is to deliver
> > display refresh events at the vblank, and we skip some unneccessay
> > vblank events if there is no cursor/primay pageflip happens during
> > this period checking the flip_done_event bitmap. In addition, if we
> > happen to a single framebuffer case, i.e. no pageflip happens in a
> > certain period, we still deliver all vblank events to userspace.
> >
> > To simplify the events delivering, we have only one eventfd
> > responsible for these display refresh events, using partitioned 8 byte
> > eventfd count value to designate different events and up to eight. Here=
 we
> define two events, i.e.
> > console refresh and cursor refresh events and its corresponding
> > increasement value, e.g. for primary(or console) framebuffer refresh
> > events DISPLAY_CON_REFRESH_EVENT, the increased val is in highest one
> > byte. When handling the event, if this byte has value, userspace knows
> > the console refresh events delivered.
>=20
> Better just say that is primary plane event, userspace won't be necessary=
 to tell
> difference from either console text mode or UI page flip, it'd still use =
vfio gfx API
> to get refreshed fb then. So this gives userspace hint on which plane to =
refresh.
>=20

[Lu, Kechen] Make sense. I'll change back to old ones, so how about DISPLAY=
_PRI_REFRESH_EVENT and DISPLAY_CUR_REFRESH_EVENT this macro naming to desig=
nate which plane refresh happens

> >
> > If after some vblanks there is no pageflip, we would assume current
> > case is single framebuffer and deliver all the vblank events to notify
> > userspace to update. Although we still have some tricks to determine
> > if this single framebuffer has updates and skip ones without update,
> > these tricks such as using checksum or hash to compare the framebuffer
> > content are computing-intensive and consuming much cpu resource when
> > idle. So to single framebuffer case, delivering fully vblank events are=
 great
> tradeoff.
>=20
> I think vblank cycle is upper bound, but we can use some heuristic method=
 to
> check update between real page flips through command or plane reg change =
or
> e.g cursor movement, etc. But anyway that's driver implementation details=
,
> we'd better expose API change to align first.
>=20

[Lu, Kechen] Agreed. In the current implementation, vblank is literally the=
 upper bound. IMO, the heuristic is supposed to be used at each emulated vb=
lank triggers, and this is exactly the current idea. But the current heuris=
tic only includes two parts, one is that we check if the virtual page flip =
event happens (i.e. check the flip_done_event bit for primary plane plus cu=
rsor plane and we have made patch here for cursor plane) In my tests, it sh=
ows that in the double framebuffer or tribble framebuffer case, the primary=
 or cursor page flip in command or programmed SURF reg necessarily means th=
e updates happens, and there is no more updates between two flips. This heu=
ristic skips some vblanks when no multiple fb updates. But, the problems re=
side in single fb case. There is no plane reg update or command submitted w=
hen only single fb, so we first think of using the checksum/hash comparison=
 of fb contents as the heuristic, however it's not a trivial one. Hence, we=
 only have another heuristic to determine if we are in single fb case, if i=
t is, let each emulated vblank as the refresh signal. For the API exposed, =
to keep things simple, we have one eventfd to deliver all planes refresh ev=
ents, and partition the counter value of eventfd to designate events.=20

> >
> > Here is the POC you can have a try, kernel upstream in branch topic/
> > display_event:
> > https://github.com/intel/gvt-linux/tree/topic/display_event ,
> > topic/display_event: https://github.com/intel/Igvtg-qemu/tree/topic/
> > display_event.
> >
>=20
> Would be easier if you can just send patches for comment.
>=20
> thanks
>

[Lu, Kechen] Sure. I will send patches directly next time.

Best Regards,
Kechen
> --
> Open Source Technology Center, Intel ltd.
>=20
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--_002_31185F57AF7C4B4F87C41E735C23A6FE64D184shsmsx102ccrcorpi_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Mon, 15 Jul 2019 07:21:09 GMT";
	modification-date="Mon, 15 Jul 2019 07:21:09 GMT"

To: Zhenyu Wang <zhenyuw@linux.intel.com>
CC: Gerd Hoffmann <kraxel@redhat.com>, "intel-gvt-dev@lists.freedesktop.org"
	<intel-gvt-dev@lists.freedesktop.org>, "Zhang, Tina" <tina.zhang@intel.com>
Subject: RE: [RFC] Display Refresh Events Delivering Poc Combining Vblanks
 and Pageflips
Thread-Topic: [RFC] Display Refresh Events Delivering Poc Combining Vblanks
 and Pageflips
Thread-Index: AdU4jyNwuCeR2zqGQ3a4BwCnvXX/bgB6pi8AABTBEqA=
References: <31185F57AF7C4B4F87C41E735C23A6FE64C87F@shsmsx102.ccr.corp.intel.com>
 <20190715032420.GC16681@zhen-hp.sh.intel.com>
In-Reply-To: <20190715032420.GC16681@zhen-hp.sh.intel.com>
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTJlYTQxM2MtZTllZi00MWM2LTk5NmQtMTc0NzU3MjgyZGJlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoib2J2VmRjZHJhVUduOWw5akErYWtKRks0NTVJUjdZc2ZFM2FYMWQ3ZldpOG4rdlB2TUxWeVJrZnR1Vm43S3dTbyJ9
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Hi,

> -----Original Message-----
> From: Zhenyu Wang [mailto:zhenyuw@linux.intel.com]
> Sent: Monday, July 15, 2019 11:24 AM
> To: Lu, Kechen <kechen.lu@intel.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>; intel-gvt-dev@lists.freedesktop.or=
g;
> Zhang, Tina <tina.zhang@intel.com>
> Subject: Re: [RFC] Display Refresh Events Delivering Poc Combining Vblank=
s and
> Pageflips
>
> On 2019.07.12 10:37:23 +0000, Lu, Kechen wrote:
> > Hi,
> >
> > As the discussions we have before about the vblank and pageflip events
> > shows that these two display event delivering favors have their own
> drawbacks, i.e.
> >
> >  1. vblanks would trigger 60 times per second constantly but sometimes =
cause
> >     extra and unnecessary handling and performance drops if no pageflip
> >     happens, though it can avoid overwhelmed events in such cases like =
moving
> >     the cursor frequently causing userspace window manager ui overhead
> > 2. pageflip events only would be embarrassing when happening to a singl=
e
> >     framebuffer like in Linux textmode console, almost no pageflips are
> >     triggered, as a consequence, the userspace does not refresh the dis=
play
> >     while framebuffer updates, thus user experience drops. Plus, just l=
ike the
> >     vblanks, if overwhelmed events deliver to userspace, the performanc=
e drops
> >     as well
> >
> >
> > These days we tried some ways to make tradeoff and take the advantage
> > of the both two favors. To be brief, the basic idea is to deliver
> > display refresh events at the vblank, and we skip some unneccessay
> > vblank events if there is no cursor/primay pageflip happens during
> > this period checking the flip_done_event bitmap. In addition, if we
> > happen to a single framebuffer case, i.e. no pageflip happens in a
> > certain period, we still deliver all vblank events to userspace.
> >
> > To simplify the events delivering, we have only one eventfd
> > responsible for these display refresh events, using partitioned 8 byte
> > eventfd count value to designate different events and up to eight. Here=
 we
> define two events, i.e.
> > console refresh and cursor refresh events and its corresponding
> > increasement value, e.g. for primary(or console) framebuffer refresh
> > events DISPLAY_CON_REFRESH_EVENT, the increased val is in highest one
> > byte. When handling the event, if this byte has value, userspace knows
> > the console refresh events delivered.
>
> Better just say that is primary plane event, userspace won't be necessary=
 to tell
> difference from either console text mode or UI page flip, it'd still use =
vfio gfx API
> to get refreshed fb then. So this gives userspace hint on which plane to =
refresh.
>

[Lu, Kechen] Make sense. I'll change back to old ones, so how about
DISPLAY_PRI_REFRESH_EVENT and DISPLAY_CUR_REFRESH_EVENT

> >
> > If after some vblanks there is no pageflip, we would assume current
> > case is single framebuffer and deliver all the vblank events to notify
> > userspace to update. Although we still have some tricks to determine
> > if this single framebuffer has updates and skip ones without update,
> > these tricks such as using checksum or hash to compare the framebuffer
> > content are computing-intensive and consuming much cpu resource when
> > idle. So to single framebuffer case, delivering fully vblank events are=
 great
> tradeoff.
>
> I think vblank cycle is upper bound, but we can use some heuristic method=
 to
> check update between real page flips through command or plane reg change =
or
> e.g cursor movement, etc. But anyway that's driver implementation details=
,
> we'd better expose API change to align first.
>

[Lu, Kechen] In the current implementation, vblank is literally the upper b=
ound.
IMO,

> >
> > Here is the POC you can have a try, kernel upstream in branch topic/
> > display_event:
> > https://github.com/intel/gvt-linux/tree/topic/display_event ,
> > topic/display_event: https://github.com/intel/Igvtg-qemu/tree/topic/
> > display_event.
> >
>
> Would be easier if you can just send patches for comment.
>
> thanks
>

[Lu, Kechen] Sure. I will send patches directly next time.

> --
> Open Source Technology Center, Intel ltd.
>
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--_002_31185F57AF7C4B4F87C41E735C23A6FE64D184shsmsx102ccrcorpi_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--_002_31185F57AF7C4B4F87C41E735C23A6FE64D184shsmsx102ccrcorpi_--
