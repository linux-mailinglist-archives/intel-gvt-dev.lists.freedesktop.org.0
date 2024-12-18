Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042E59F6EAA
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Dec 2024 21:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D4B10E42E;
	Wed, 18 Dec 2024 20:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QrIV24G5";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834FD10E42E;
 Wed, 18 Dec 2024 20:03:46 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-71e1158fe3eso6689a34.1; 
 Wed, 18 Dec 2024 12:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734552225; x=1735157025; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PjDQi+CWRY9hqdyZ5tMYPH07w9hoqh6eMi/QEjbtsQU=;
 b=QrIV24G5vg/etyh+cX1XbKC0jXDVHSHBZN7HQr9aSz1esFZp3+lM5IMGdZsRi/IAVf
 09RKwdxR1niihbKbhbAV1vFaaIOVfjf0VWWSxVfly6tjt1CChW5KVRyMepvuzMpA0aWM
 llV9NzhNYtDP5BbBscQbOMe5sCkngZY+FsDNu7sBFyde1sEXCE22QkYGvFbr5vod1bxG
 /6Zx3ICQA+i3Z/Pu3nEKfcQyDTPOAFEmhA9zK17zgAWBRC0r0t+Q05/EL+NhDUQi/KmP
 wQaxWpSQBAqRfCr5YUGZaXjwSpLeNb7YAebNvk+rir/P6vDPz/HR5OJPHjE+8skIlEaf
 21lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734552225; x=1735157025;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PjDQi+CWRY9hqdyZ5tMYPH07w9hoqh6eMi/QEjbtsQU=;
 b=ra29C9ze74jRDbBPvhoM7bNik2wgMiiAwy0RvjB8gmpTPfwcNf/iKdW+2wlGrXeAI2
 NGFS4supLaC8a8/mkhI/Btl8Hj9HZYumwt7sTLkqAmmwUWoJG9mI2VZ8Ugat4DpiD5nC
 qkKeyAP5fUh4Z4pcKR1IrSrJg1bo7WFNFqilpfWPjMc8FQRi0iMLDiLYnx69Rs7WsDVf
 VqkJZbcwjJOJIxUpmEbbk8ajnHjipkk6KdVZl6NocOAVZZk1RLylrhuU6Zx/Haz5ZRks
 WrVtnKJ22n7jNFWnzr4COfyw9/upHCpy0JQSqrK91VpVTTlLW1AzwbAnHRqQTwVplFn2
 ubzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2nB1s7v9dYqb12Onr9y1KJFQts1cG8tvZGA+Av7C7nnrBDnaULIvCvzLHxI1gmBm/auwxNS61ozfvxfnC/A==@lists.freedesktop.org,
 AJvYcCU5aPfeoq9dfuAA2ir8AVQWnC8Nw9QY7krmIjRVActOsPyuktx4MNMms5xu/y9BL1ieJbW1zb9OWII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAEwAPhfvTnBb8kZsPd8p3BSbBcIOt0c/ldn6wzLovza2p6XIG
 t7qG7/MPRyvQoKJs8nnlmTFs9iY+UBjQoc/iNfbxbBscam5ykLJJqakOUuPjRQ+4g0l3jwMishr
 V07YzlrwROTuE5QD/XAJi7SYrYpQ=
X-Gm-Gg: ASbGnct5YPN8GO7NzHwB28ZPqaVzUSruKze+f076wVtGDXdhjm03x0nioOtjfm+1/m2
 MDg4F6jAcFirSQYQboM77W6jWHQ9H9rCqK8whPlM=
X-Google-Smtp-Source: AGHT+IErjtQUc5B1h9rjkNyUsQo+JNaiMjE4lAYui3/tYiFx6+c93krlH09SiFg+LAF5KeXa2Kyng8CMKOYjbka3PQ4=
X-Received: by 2002:a05:6830:6e94:b0:717:f666:9559 with SMTP id
 46e09a7af769-71fb757adf6mr2607387a34.9.1734552225559; Wed, 18 Dec 2024
 12:03:45 -0800 (PST)
MIME-Version: 1.0
References: <20241218141945.2588604-1-jani.nikula@intel.com>
 <IA1PR11MB6467C5B58659EF7CBA993AA4E3052@IA1PR11MB6467.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB6467C5B58659EF7CBA993AA4E3052@IA1PR11MB6467.namprd11.prod.outlook.com>
From: Zhi Wang <zhi.wang.linux@gmail.com>
Date: Wed, 18 Dec 2024 21:03:34 +0100
Message-ID: <CAN=xO451z7D0vMBZd4NEH9oTvs5AwJ1g=GkZ-D4y9VNUFWdiSQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: store virtual_dp_monitor_edid in rodata
To: "Garg, Nemesa" <nemesa.garg@intel.com>
Cc: "Nikula, Jani" <jani.nikula@intel.com>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="0000000000003fba87062990e95a"
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000003fba87062990e95a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Zhi Wang <zhiwang@kernel.org>

Garg, Nemesa <nemesa.garg@intel.com> =E4=BA=8E 2024=E5=B9=B412=E6=9C=8818=
=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=883:37=E5=86=99=E9=81=93=EF=BC=
=9A

>
>
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Jani
> > Nikula
> > Sent: Wednesday, December 18, 2024 7:50 PM
> > To: intel-gfx@lists.freedesktop.org
> > Cc: intel-gvt-dev@lists.freedesktop.org; Nikula, Jani <
> jani.nikula@intel.com>
> > Subject: [PATCH] drm/i915/gvt: store virtual_dp_monitor_edid in rodata
> >
> > The virtual DP EDID isn't modified. Add const modifier to store it in
> rodata.
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> LGTM,
> Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/display.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/display.c
> > b/drivers/gpu/drm/i915/gvt/display.c
> > index 95570cabdf27..c98dfcc3d0de 100644
> > --- a/drivers/gpu/drm/i915/gvt/display.c
> > +++ b/drivers/gpu/drm/i915/gvt/display.c
> > @@ -97,7 +97,7 @@ int pipe_is_enabled(struct intel_vgpu *vgpu, int pipe=
)
> >       return 0;
> >  }
> >
> > -static unsigned char virtual_dp_monitor_edid[GVT_EDID_NUM][EDID_SIZE]
> > =3D {
> > +static const unsigned char
> > +virtual_dp_monitor_edid[GVT_EDID_NUM][EDID_SIZE] =3D {
> >       {
> >  /* EDID with 1024x768 as its resolution */
> >               /*Header*/
> > --
> > 2.39.5
>
>

--0000000000003fba87062990e95a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Reviewed-by: Zhi Wang &lt;<a href=3D"mailto:zhiwang@kernel.o=
rg">zhiwang@kernel.org</a>&gt;</p>
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">Garg, Nemesa &lt;<a href=3D"mailto:nemesa.garg@intel.com">n=
emesa.garg@intel.com</a>&gt; =E4=BA=8E 2024=E5=B9=B412=E6=9C=8818=E6=97=A5=
=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=883:37=E5=86=99=E9=81=93=EF=BC=9A<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Intel-gfx &lt;<a href=3D"mailto:intel-gfx-bounces@lists.freedesk=
top.org" target=3D"_blank" rel=3D"noreferrer">intel-gfx-bounces@lists.freed=
esktop.org</a>&gt; On Behalf Of Jani<br>
&gt; Nikula<br>
&gt; Sent: Wednesday, December 18, 2024 7:50 PM<br>
&gt; To: <a href=3D"mailto:intel-gfx@lists.freedesktop.org" target=3D"_blan=
k" rel=3D"noreferrer">intel-gfx@lists.freedesktop.org</a><br>
&gt; Cc: <a href=3D"mailto:intel-gvt-dev@lists.freedesktop.org" target=3D"_=
blank" rel=3D"noreferrer">intel-gvt-dev@lists.freedesktop.org</a>; Nikula, =
Jani &lt;<a href=3D"mailto:jani.nikula@intel.com" target=3D"_blank" rel=3D"=
noreferrer">jani.nikula@intel.com</a>&gt;<br>
&gt; Subject: [PATCH] drm/i915/gvt: store virtual_dp_monitor_edid in rodata=
<br>
&gt; <br>
&gt; The virtual DP EDID isn&#39;t modified. Add const modifier to store it=
 in rodata.<br>
&gt; <br>
&gt; Signed-off-by: Jani Nikula &lt;<a href=3D"mailto:jani.nikula@intel.com=
" target=3D"_blank" rel=3D"noreferrer">jani.nikula@intel.com</a>&gt;<br>
<br>
LGTM,<br>
Reviewed-by: Nemesa Garg &lt;<a href=3D"mailto:nemesa.garg@intel.com" targe=
t=3D"_blank" rel=3D"noreferrer">nemesa.garg@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/i915/gvt/display.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/i915/gvt/display.c<br>
&gt; b/drivers/gpu/drm/i915/gvt/display.c<br>
&gt; index 95570cabdf27..c98dfcc3d0de 100644<br>
&gt; --- a/drivers/gpu/drm/i915/gvt/display.c<br>
&gt; +++ b/drivers/gpu/drm/i915/gvt/display.c<br>
&gt; @@ -97,7 +97,7 @@ int pipe_is_enabled(struct intel_vgpu *vgpu, int pip=
e)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; -static unsigned char virtual_dp_monitor_edid[GVT_EDID_NUM][EDID_SIZE]=
<br>
&gt; =3D {<br>
&gt; +static const unsigned char<br>
&gt; +virtual_dp_monitor_edid[GVT_EDID_NUM][EDID_SIZE] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 /* EDID with 1024x768 as its resolution */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*Header*/<br>
&gt; --<br>
&gt; 2.39.5<br>
<br>
</blockquote></div>

--0000000000003fba87062990e95a--
