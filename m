Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD7666AF5
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 12 Jul 2019 12:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDE06E346;
	Fri, 12 Jul 2019 10:37:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7E36E346
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 Jul 2019 10:37:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jul 2019 03:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,482,1557212400"; 
 d="scan'208,217";a="193715389"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2019 03:37:26 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 12 Jul 2019 03:37:26 -0700
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 12 Jul 2019 03:37:25 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.3]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.240]) with mapi id 14.03.0439.000;
 Fri, 12 Jul 2019 18:37:24 +0800
From: "Lu, Kechen" <kechen.lu@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [RFC] Display Refresh Events Delivering Poc Combining Vblanks and
 Pageflips
Thread-Topic: [RFC] Display Refresh Events Delivering Poc Combining Vblanks
 and Pageflips
Thread-Index: AdU4jyNwuCeR2zqGQ3a4BwCnvXX/bg==
Date: Fri, 12 Jul 2019 10:37:23 +0000
Message-ID: <31185F57AF7C4B4F87C41E735C23A6FE64C87F@shsmsx102.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzE3M2MzZDktZDBjYy00ZjBjLWJkYTktN2FiODFiMTU5YTlmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiem5GT0tORk01RFNvK0krbkRvekRYMG83bVZ5WHYzVXY1aTdVbEs4S1R3eEpPU0ZjdDhWMTZcLzJQU05TY0JSVXgifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
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
 <intel-gvt-dev@lists.freedesktop.org>, "Zhang, Tina" <tina.zhang@intel.com>
Content-Type: multipart/mixed; boundary="===============0495962882=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0495962882==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_31185F57AF7C4B4F87C41E735C23A6FE64C87Fshsmsx102ccrcorpi_"

--_000_31185F57AF7C4B4F87C41E735C23A6FE64C87Fshsmsx102ccrcorpi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

As the discussions we have before about the vblank and pageflip events show=
s that these two display event delivering favors have their own drawbacks, =
i.e.
1.      vblanks would trigger 60 times per second constantly but sometimes =
cause extra and unnecessary handling and performance drops if no pageflip h=
appens, though it can avoid overwhelmed events in such cases like moving th=
e cursor frequently causing userspace window manager ui overhead
2.      pageflip events only would be embarrassing when happening to a sing=
le framebuffer like in Linux textmode console, almost no pageflips are trig=
gered, as a consequence, the userspace does not refresh the display while f=
ramebuffer updates, thus user experience drops. Plus, just like the vblanks=
, if overwhelmed events deliver to userspace, the performance drops as well

These days we tried some ways to make tradeoff and take the advantage of th=
e both two favors. To be brief, the basic idea is to deliver display refres=
h events at the vblank, and we skip some unneccessay vblank events if there=
 is no cursor/primay pageflip happens during this period checking the flip_=
done_event bitmap. In addition, if we happen to a single framebuffer case, =
i.e. no pageflip happens in a certain period, we still deliver all vblank e=
vents to userspace.

To simplify the events delivering, we have only one eventfd responsible for=
 these display refresh events, using partitioned 8 byte eventfd count value=
 to designate different events and up to eight. Here we define two events, =
i.e. console refresh and cursor refresh events and its corresponding increa=
sement value, e.g. for primary(or console) framebuffer refresh events DISPL=
AY_CON_REFRESH_EVENT, the increased val is in highest one byte. When handli=
ng the event, if this byte has value, userspace knows the console refresh e=
vents delivered.

If after some vblanks there is no pageflip, we would assume current case is=
 single framebuffer and deliver all the vblank events to notify userspace t=
o update. Although we still have some tricks to determine if this single fr=
amebuffer has updates and skip ones without update, these tricks such as us=
ing checksum or hash to compare the framebuffer content are computing-inten=
sive and consuming much cpu resource when idle. So to single framebuffer ca=
se, delivering fully vblank events are great tradeoff.

Here is the POC you can have a try, kernel upstream in branch topic/display=
_event: https://github.com/intel/gvt-linux/tree/topic/display_event , topic=
/display_event: https://github.com/intel/Igvtg-qemu/tree/topic/display_even=
t.

Thanks.

Best Regards,
Kechen




--_000_31185F57AF7C4B4F87C41E735C23A6FE64C87Fshsmsx102ccrcorpi_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">
<div>Hi,</div>
<div><font face=3D"Times New Roman">&nbsp;</font></div>
<div>As the discussions we have before about the vblank and pageflip events=
 shows that these two display event delivering favors have their own drawba=
cks, i.e. </div>
<ol style=3D"margin:0;padding-left:36pt;">
<li>vblanks would trigger 60 times per second constantly but sometimes caus=
e extra and unnecessary handling and performance drops if no pageflip happe=
ns, though it can avoid overwhelmed events in such cases like moving the cu=
rsor frequently causing userspace
window manager ui overhead </li><li>pageflip events only would be embarrass=
ing when happening to a single framebuffer like in Linux textmode console, =
almost no pageflips are triggered, as a consequence, the userspace does not=
 refresh the display while framebuffer updates, thus user experience
drops. Plus, just like the vblanks, if overwhelmed events deliver to usersp=
ace, the performance drops as well</li></ol>
<div><font face=3D"Times New Roman">&nbsp;</font></div>
<div>These days we tried some ways to make tradeoff and take the advantage =
of the both two favors. To be brief, the basic idea is to deliver display r=
efresh events at the vblank, and we skip some unneccessay vblank events if =
there is no cursor/primay pageflip
happens during this period checking the flip_done_event bitmap. In addition=
, if we happen to a single framebuffer case, i.e. no pageflip happens in a =
certain period, we still deliver all vblank events to userspace.</div>
<div><font face=3D"Times New Roman">&nbsp;</font></div>
<div>To simplify the events delivering, we have only one eventfd responsibl=
e for these display refresh events, using partitioned 8 byte eventfd count =
value to designate different events and up to eight. Here we define two eve=
nts, i.e. console refresh and cursor
refresh events and its corresponding increasement value, e.g. for primary(o=
r console) framebuffer refresh events DISPLAY_CON_REFRESH_EVENT, the increa=
sed val is in highest one byte. When handling the event, if this byte has v=
alue, userspace knows the console
refresh events delivered. </div>
<div>&nbsp;</div>
<div>If after some vblanks there is no pageflip, we would assume current ca=
se is single framebuffer and deliver all the vblank events to notify usersp=
ace to update. Although we still have some tricks to determine if this sing=
le framebuffer has updates and skip
ones without update, these tricks such as using checksum or hash to compare=
 the framebuffer content are computing-intensive and consuming much cpu res=
ource when idle. So to single framebuffer case, delivering fully vblank eve=
nts are great tradeoff.</div>
<div><font face=3D"Times New Roman">&nbsp;</font></div>
<div>Here is the POC you can have a try, kernel upstream in branch topic/di=
splay_event: <a href=3D"https://github.com/intel/gvt-linux/tree/topic/displ=
ay_event"><font color=3D"#0563C1"><u>https://github.com/intel/gvt-linux/tre=
e/topic/display_event</u></font></a>
, topic/display_event: <a href=3D"https://github.com/intel/Igvtg-qemu/tree/=
topic/display_event"><font color=3D"#0563C1"><u>https://github.com/intel/Ig=
vtg-qemu/tree/topic/display_event</u></font></a>. </div>
<div><font face=3D"Times New Roman">&nbsp;</font></div>
<div>Thanks.</div>
<div><font face=3D"Times New Roman">&nbsp;</font></div>
<div>Best Regards,</div>
<div>Kechen</div>
<div><font face=3D"Times New Roman">&nbsp;</font></div>
<div><font face=3D"Times New Roman">&nbsp;</font></div>
<div><font face=3D"Times New Roman">&nbsp;</font></div>
</span></font>
</body>
</html>

--_000_31185F57AF7C4B4F87C41E735C23A6FE64C87Fshsmsx102ccrcorpi_--

--===============0495962882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0495962882==--
