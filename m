Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFA421B149
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Jul 2020 10:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA09E6EB94;
	Fri, 10 Jul 2020 08:28:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 1059 seconds by postgrey-1.36 at gabe;
 Fri, 10 Jul 2020 08:28:18 UTC
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403606EB94
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Jul 2020 08:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Type:MIME-Version:Date:
 Message-ID:Cc:Subject:From:To:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qATY1I9x+x5+St6YplnwJo9rTLLPPZD3uTSZTGyU8/U=; b=NV3Ny9H/Cjo2h6/xsLwsmWM3A
 T3l4GaITJEioJHBv9AAQjsSbVaj4hS8iLebTsBJKOalNMIllkUYCG8hX3il7SLH6WcrnHNPOUAIuh
 JnFjq5ZrRtSz9QRtBEVLog/GsRVmkCisGwR4nvYd6WQFrvEk6AAq+7lHB7ZpO2GlkDIvKi8xE8eTu
 hkWnhsdzZgz4w2+0gEgQ7Okps5sscNu+c4SC2w9EcKGghUgMkLV05kxCjNnFUcTR4BZ0NMtDMWPPJ
 SwF81ucGvTOERtJBHXhq7QuOv39MhDS4iJNUIFtfBplvBDXq+MTbNZD4a70VtUfBfVgajBjEeAHj6
 yp41Z54Fg==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <stefan.hertrampf@cyberus-technology.de>)
 id 1jto7B-0003ec-Ju; Fri, 10 Jul 2020 10:10:37 +0200
Received: from [84.19.193.194] (helo=[192.168.178.25])
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <stefan.hertrampf@cyberus-technology.de>)
 id 1jto7B-000PlD-Dl; Fri, 10 Jul 2020 10:10:37 +0200
To: intel-gvt-dev@lists.freedesktop.org
From: Stefan Hertrampf <stefan.hertrampf@cyberus-technology.de>
Subject: Set custom EDID
Message-ID: <83a23f57-ee8b-6b39-3d99-ecb5ae36df8a@cyberus-technology.de>
Date: Fri, 10 Jul 2020 10:10:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Authenticated-Sender: stefan.hertrampf@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.3/25868/Thu Jul  9 15:58:00 2020)
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
Cc: Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Thomas Prescher <thomas.prescher@cyberus-technology.de>
Content-Type: multipart/mixed; boundary="===============1764224617=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1764224617==
Content-Type: multipart/alternative;
 boundary="------------5B306BA5E2848C17DCEE5C0B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5B306BA5E2848C17DCEE5C0B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

we are developing a custom hypervisor backend for GVT which (from the
mediators perspective) behaves like XEN.

Currently, we are working with the Linux Kernel v5.4.41 and we are
trying to pass a custom EDID to a given vGPU.

The code flow roughly looks like this:

|vgpu =3D intel_gvt_ops->vgpu_create();|

|port =3D intel_vgpu_port(vgpu, port);||
|

|edid_data =3D intel_vgpu_edid_block(port);|

|memcpy(edid_data, custom_edid, EDID_SIZE);|

We are wondering how the |set_edid| callback of the |intel_gvt_mpt| is
meant to be used to receive the correct port where the virtual display
is attached. In v5.4.41 it seems, the default port is PORT_B and the
mediator only calls |set_edid| on certain platforms where it is a
different port. Is this correct?

Is there any other method to receive the correct port?

It seems that in v5.4.41 the mediator misses to call |set_edid| if the
platform |IS_COFFEELAKE|, which leads to a crash because we then assume
the default PORT_B where no memory is allocated for the EDID data.

Also in some later commits [1] the behavior is changed and the
|set_edid| callback is always called passing PORT_D. Does that mean that
the virtual display is always attached at PORT_D on newer versions of GVT=
?

Greetings,

Stefan


[1]
https://github.com/torvalds/linux/commit/0178f4ce3c3be4d9784c88ed512816eb=
653a717b


--------------5B306BA5E2848C17DCEE5C0B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello,</p>
    <p>we are developing a custom hypervisor backend for GVT which (from
      the mediators perspective) behaves like XEN.</p>
    <p>Currently, we are working with the Linux Kernel v5.4.41 and we
      are trying to pass a custom EDID to a given vGPU.</p>
    <p>The code flow roughly looks like this:</p>
    <code>vgpu = intel_gvt_ops-&gt;vgpu_create();</code>
    <p><code>port = intel_vgpu_port(vgpu, port);</code><code><br>
      </code></p>
    <p><code>edid_data = intel_vgpu_edid_block(port);</code></p>
    <p><code>memcpy(edid_data, custom_edid, EDID_SIZE);</code><br>
    </p>
    <p>We are wondering how the <code>set_edid</code> callback of the <code>intel_gvt_mpt</code>
      is meant to be used to receive the correct port where the virtual
      display is attached. In v5.4.41 it seems, the default port is
      PORT_B and the mediator only calls <code>set_edid</code> on
      certain platforms where it is a different port. Is this correct?</p>
    <p>Is there any other method to receive the correct port?</p>
    <p>It seems that in v5.4.41 the mediator misses to call <code>set_edid</code>
      if the platform <span class="blob-code-inner blob-code-marker"
        data-code-marker="-"><span class="pl-c1"><code>IS_COFFEELAKE</code>,
          which leads to a crash because we then assume the default
          PORT_B where no memory is allocated for the EDID data.<br>
        </span></span></p>
    <p>Also in some later commits [1] the behavior is changed and the <code>set_edid</code>
      callback is always called passing PORT_D. Does that mean that the
      virtual display is always attached at PORT_D on newer versions of
      GVT?<br>
    </p>
    <p>Greetings,</p>
    <p>Stefan</p>
    <p><br>
    </p>
    <p>[1]
<a class="moz-txt-link-freetext" href="https://github.com/torvalds/linux/commit/0178f4ce3c3be4d9784c88ed512816eb653a717b">https://github.com/torvalds/linux/commit/0178f4ce3c3be4d9784c88ed512816eb653a717b</a><br>
    </p>
  </body>
</html>

--------------5B306BA5E2848C17DCEE5C0B--

--===============1764224617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1764224617==--
