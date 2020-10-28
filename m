Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3583B29CFA6
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 28 Oct 2020 12:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D578B6EC67;
	Wed, 28 Oct 2020 11:19:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5BD6E4FE;
 Wed, 28 Oct 2020 11:18:50 +0000 (UTC)
IronPort-SDR: uI3tlewNgphi5B1hf8FTXEMaWbnJGHVgxP/f2yF4JEDoRKCZhBJ3LCCwq1XhVC/50ozBP7C9YT
 1bKFFLYgyn4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="232423283"
X-IronPort-AV: E=Sophos;i="5.77,426,1596524400"; 
 d="scan'208,217";a="232423283"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 04:18:49 -0700
IronPort-SDR: NWJjm8rflGAKvSqCR/AytOskHVJGktQfmnO0sTqpl4BYYb9wduRxYHmrnJG2K0kAU8FGRIYKPu
 sgChWzJzLdfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,426,1596524400"; 
 d="scan'208,217";a="318560558"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by orsmga003.jf.intel.com with ESMTP; 28 Oct 2020 04:18:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 11:18:47 +0000
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Wed, 28 Oct 2020 04:18:45 -0700
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-fixes
Thread-Topic: [Intel-gfx] [PULL] gvt-fixes
Thread-Index: AQHWrBKsP6vgaCbhMUe7vqjiY+MZE6msYcGAgADzpYA=
Date: Wed, 28 Oct 2020 11:18:45 +0000
Message-ID: <C9292B4F-9A82-46AF-BFAB-D372D202F314@intel.com>
References: <20201027031740.GA27141@zhen-hp.sh.intel.com>
 <20201027204643.GE3771340@intel.com>
In-Reply-To: <20201027204643.GE3771340@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-originating-ip: [10.22.254.132]
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
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv, 
 Zhiyuan" <zhiyuan.lv@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
Content-Type: multipart/mixed; boundary="===============0754569269=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0754569269==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_C9292B4F9A8246AFBFABD372D202F314intelcom_"

--_000_C9292B4F9A8246AFBFABD372D202F314intelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On Oct 27, 2020, at 1:46 PM, Rodrigo Vivi <rodrigo.vivi@intel.com<mailto:ro=
drigo.vivi@intel.com>> wrote:

On Tue, Oct 27, 2020 at 11:17:40AM +0800, Zhenyu Wang wrote:

Hi,

Here's first gvt fixes for 5.10 which includes more vGPU
suspend/resume fix in HWSP reset handling, and also fix for host i915
suspend regression when vGPU is created (not need to be active), and
one workaround for APL guest hang issue.

pulled to drm-intel-fixes

I'm actually pulling it off. I had bypassed dim, considering this was an ol=
d issue with our email decoder,
but it happens that

$ git show 401ccfa87856 | grep Fixes
Fixes: e6ba76480299 (drm/i915: Remove i915->kernel_context)

And this is what it should have:

$ dim fixes e6ba76480299 | grep Fixes
Fixes: e6ba76480299 ("drm/i915: Remove i915->kernel_context")

Sorry for the trouble.
Let's fix this in place so we don't propagate bad tag that might break othe=
r scripts on the way

Sorry,
Rodrigo.

thanks


Thanks
--
The following changes since commit 16cce04cdb200ba905d1241b425ac48da5a9ace5=
:

 drm/i915/selftests: Push the fake iommu device from the stack to data (202=
0-09-23 10:15:46 +0300)

are available in the Git repository at:

 https://github.com/intel/gvt-linux tags/gvt-fixes-2020-10-27

for you to fetch changes up to 401ccfa87856656b874c737522ea92721394a348:

 drm/i915/gvt: Only pin/unpin intel_context along with workload (2020-10-19=
 16:54:28 +0800)

----------------------------------------------------------------
gvt-fixes-2020-10-27

- Fix HWSP reset handling during vGPU suspend/resume (Colin)
- Apply flush workaround on APL now for possible guest hang (Colin)
- Fix vGPU context pin/unpin also for host suspend regression with
 vGPU created (Colin)

----------------------------------------------------------------
Colin Xu (3):
     drm/i915/gvt: Allow zero out HWSP addr on hws_pga_write
     drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU BB hang
     drm/i915/gvt: Only pin/unpin intel_context along with workload

drivers/gpu/drm/i915/gvt/handlers.c  | 35 +++++++++++++++++++++++++++++++++=
--
drivers/gpu/drm/i915/gvt/scheduler.c | 15 ++++++++-------
2 files changed, 41 insertions(+), 9 deletions(-)


--

$gpg --keyserver wwwkeys.pgp.net<http://wwwkeys.pgp.net> --recv-keys 4D7818=
27


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org<mailto:Intel-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/intel-gfx


--_000_C9292B4F9A8246AFBFABD372D202F314intelcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <F60C8D5E5E452C46888CB32D04CA331E@intel.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On Oct 27, 2020, at 1:46 PM, Rodrigo Vivi &lt;<a href=3D"ma=
ilto:rodrigo.vivi@intel.com" class=3D"">rodrigo.vivi@intel.com</a>&gt; wrot=
e:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">On
 Tue, Oct 27, 2020 at 11:17:40AM &#43;0800, Zhenyu Wang wrote:</span><br st=
yle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; te=
xt-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
<br class=3D"">
Hi,<br class=3D"">
<br class=3D"">
Here's first gvt fixes for 5.10 which includes more vGPU<br class=3D"">
suspend/resume fix in HWSP reset handling, and also fix for host i915<br cl=
ass=3D"">
suspend regression when vGPU is created (not need to be active), and<br cla=
ss=3D"">
one workaround for APL guest hang issue.<br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">pulled
 to drm-intel-fixes</span><br style=3D"caret-color: rgb(0, 0, 0); font-fami=
ly: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norm=
al; font-weight: normal; letter-spacing: normal; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -w=
ebkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>I'm actually pulling it off. I had bypassed dim, considering this was =
an old issue with our email decoder,</div>
<div>but it happens that&nbsp;</div>
<div><br class=3D"">
</div>
<div>$ git show 401ccfa87856 | grep Fixes</div>
<div>Fixes: e6ba76480299 (drm/i915: Remove i915-&gt;kernel_context)</div>
<div><br class=3D"">
</div>
<div>And this is what it should have:</div>
<div><br class=3D"">
</div>
<div>$ dim fixes e6ba76480299 | grep Fixes</div>
<div>Fixes: e6ba76480299 (&quot;drm/i915: Remove i915-&gt;kernel_context&qu=
ot;)</div>
<div><br class=3D"">
</div>
<div>Sorry for the trouble.</div>
<div>Let's fix this in place so we don't propagate bad tag that might break=
 other scripts on the way</div>
<div><br class=3D"">
</div>
<div>Sorry,</div>
<div>Rodrigo.</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">thanks</span><br style=3D"caret-color: rgb(0, 0, 0);=
 font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-=
caps: normal; font-weight: normal; letter-spacing: normal; text-align: star=
t; text-indent: 0px; text-transform: none; white-space: normal; word-spacin=
g: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
<br class=3D"">
Thanks<br class=3D"">
--<br class=3D"">
The following changes since commit 16cce04cdb200ba905d1241b425ac48da5a9ace5=
:<br class=3D"">
<br class=3D"">
&nbsp;drm/i915/selftests: Push the fake iommu device from the stack to data=
 (2020-09-23 10:15:46 &#43;0300)<br class=3D"">
<br class=3D"">
are available in the Git repository at:<br class=3D"">
<br class=3D"">
&nbsp;<a href=3D"https://github.com/intel/gvt-linux" class=3D"">https://git=
hub.com/intel/gvt-linux</a> tags/gvt-fixes-2020-10-27<br class=3D"">
<br class=3D"">
for you to fetch changes up to 401ccfa87856656b874c737522ea92721394a348:<br=
 class=3D"">
<br class=3D"">
&nbsp;drm/i915/gvt: Only pin/unpin intel_context along with workload (2020-=
10-19 16:54:28 &#43;0800)<br class=3D"">
<br class=3D"">
----------------------------------------------------------------<br class=
=3D"">
gvt-fixes-2020-10-27<br class=3D"">
<br class=3D"">
- Fix HWSP reset handling during vGPU suspend/resume (Colin)<br class=3D"">
- Apply flush workaround on APL now for possible guest hang (Colin)<br clas=
s=3D"">
- Fix vGPU context pin/unpin also for host suspend regression with<br class=
=3D"">
&nbsp;vGPU created (Colin)<br class=3D"">
<br class=3D"">
----------------------------------------------------------------<br class=
=3D"">
Colin Xu (3):<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/i915/gvt: Allow zero out HWSP addr on hws=
_pga_write<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL t=
o workaround GPU BB hang<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drm/i915/gvt: Only pin/unpin intel_context al=
ong with workload<br class=3D"">
<br class=3D"">
drivers/gpu/drm/i915/gvt/handlers.c &nbsp;| 35 &#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--<br class=
=3D"">
drivers/gpu/drm/i915/gvt/scheduler.c | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;-------<br class=3D"">
2 files changed, 41 insertions(&#43;), 9 deletions(-)<br class=3D"">
<br class=3D"">
<br class=3D"">
--<span class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">
<br class=3D"">
$gpg --keyserver <a href=3D"http://wwwkeys.pgp.net" class=3D"">wwwkeys.pgp.=
net</a> --recv-keys 4D781827<br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">_______________________________________________</span><br style=3D"c=
aret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-sty=
le: normal; font-variant-caps: normal; font-weight: normal; letter-spacing:=
 normal; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decor=
ation: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Intel-gfx
 mailing list</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: He=
lvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; text-decoration: none;" class=3D"">
<a href=3D"mailto:Intel-gfx@lists.freedesktop.org" style=3D"font-family: He=
lvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; orphans: auto; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; widows: auto=
; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-wi=
dth: 0px;" class=3D"">Intel-gfx@lists.freedesktop.org</a><br style=3D"caret=
-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: nor=
mal; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoratio=
n: none;" class=3D"">
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/intel-gfx" style=
=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font-varia=
nt-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -we=
bkit-text-stroke-width: 0px;" class=3D"">https://lists.freedesktop.org/mail=
man/listinfo/intel-gfx</a></div>
</blockquote>
</div>
<br class=3D"">
</body>
</html>

--_000_C9292B4F9A8246AFBFABD372D202F314intelcom_--

--===============0754569269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0754569269==--
