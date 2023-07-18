Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E90758723
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Jul 2023 23:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0485710E3BE;
	Tue, 18 Jul 2023 21:27:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CC510E3BE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Jul 2023 21:27:41 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-262d9e75438so4288616a91.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Jul 2023 14:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689715660; x=1692307660;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yYhIogeIZPjP50kZgCkG4C7a9W+jnWpa2bq+htH+e6E=;
 b=h0aY4y9PsU0g1DEFnJYM0/ru4Oz9G0He7R+gql+2YKDDrQ0+6n1ztlKoKhqBob0+B/
 G6rD6QCAXWOuvsTFwzEdZeWTHqd29QPlpb8iUSB/FV8pqzd/+c6lK10wRMjRoT8eDpNe
 5mqG5UpB2K5Ey1bf8l3bLGwoLMRsygTsh0QP6xN8UFZLZ9YwAfNkm9CpxHQ43v/NfLCM
 3xKkxivAMdzF+seRtehK8Tr+ywW3Zwji0EKTxW1R0PsZHDFRX5kGpts2LoNsAK1f5yDq
 1mDfvNWgr2jRBHX5PTGpes8HXK7mYDMRc5HlSTNFu0QtaHVbEeYZyNdzqoVMDR71DZLn
 vaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689715660; x=1692307660;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yYhIogeIZPjP50kZgCkG4C7a9W+jnWpa2bq+htH+e6E=;
 b=gOb9T4i+9BKB6FDmD/s10GH7zzZEL5N0WVPFPYb6Jqm+EazLMnWlomTxL/OkgPsS1C
 FSZuhdZN9Xqeqf3UEVB3oYKVSTdmNlPZTMT4Vum9mR+DYkeueLLW1Xv+7IF8baW+je5p
 6Q3ZogJvbI8cU0uXAxvYAnqkSmrMJg7mcRRWuoqcl0+diTLSJYxM7f2YJ0imszSNfPVD
 bTF7B5uTExIe5d5wX5DuztvfLF9O9VzZX+SSApSd9blTnBJR9LwEj2GzwX2jLApcl35f
 dA0yfqppiLO6uN8zB3GtBgrbfbajokmiuJ5ivc4iwEC0nIxMvhd2LgZP+8xW2I/yvKd3
 8XWg==
X-Gm-Message-State: ABy/qLZKPRXbdR+2zbQx1HfAvLP36ASMM44EpyFDT2VUH6AlHsfQeTkJ
 wN1aDtGTJfxLnlzBpjKhU/b3wsNTSumHIJScpjyElMURc2M=
X-Google-Smtp-Source: APBJJlFKu7VU0nHk2tyOePRHnlx9WKZspIeFK/ryzMQmKQvGHOmzckdujERNFc7Ce5yuEKdc6rPiqlQXJs/CBZNREFw=
X-Received: by 2002:a17:90a:71c8:b0:262:f093:e26d with SMTP id
 m8-20020a17090a71c800b00262f093e26dmr313583pjs.46.1689715660075; Tue, 18 Jul
 2023 14:27:40 -0700 (PDT)
MIME-Version: 1.0
From: Storm Silva <stormmsilva@gmail.com>
Date: Tue, 18 Jul 2023 14:27:28 -0700
Message-ID: <CAA+VxyetHKaseu8eTGjy9bO4uk4Qej-fr6pvqbBA_reJFbDpRg@mail.gmail.com>
Subject: [PATCH] golden_hw_state failed with error -2
To: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000b0b90b0600c995e7"
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

--000000000000b0b90b0600c995e7
Content-Type: text/plain; charset="UTF-8"

Hello, my name is Storm Silva. I submitted an issue in the intel-gvt GitHub
repo at https://github.com/intel/gvt-linux/issues/212 and have also
submitted a pull request which would fix issues #212 and #77 at
https://github.com/intel/gvt-linux/pull/215 but was told that requests
should be sent to this email to get merged. Can someone please take a look
at this? It is a simple one-line fix replacing
ret = request_firmware(&fw, path, gvt->gt->i915->drm.dev); with
ret = firmware_request_nowarn(&fw, path, gvt->gt->i915->drm.dev); Thank you!

--000000000000b0b90b0600c995e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, my name is Storm Silva. I submitted an issue in the=
 intel-gvt GitHub repo at=C2=A0<a href=3D"https://github.com/intel/gvt-linu=
x/issues/212">https://github.com/intel/gvt-linux/issues/212</a>=C2=A0and ha=
ve also submitted=C2=A0a pull request which would fix issues #212 and #77 a=
t=C2=A0<a href=3D"https://github.com/intel/gvt-linux/pull/215">https://gith=
ub.com/intel/gvt-linux/pull/215</a> but was told that requests should be se=
nt to this email to get merged. Can someone please take a look at this? It =
is a simple one-line fix replacing=C2=A0<br><span style=3D"color:rgb(31,35,=
40);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Conso=
las,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;background-color=
:rgba(175,184,193,0.2)">ret =3D request_firmware(&amp;fw, path, gvt-&gt;gt-=
&gt;i915-&gt;<a href=3D"http://drm.dev">drm.dev</a>);
</span>with<br><span style=3D"color:rgb(31,35,40);font-family:ui-monospace,=
SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quo=
t;,monospace;font-size:11.9px;background-color:rgba(175,184,193,0.2)">ret =
=3D firmware_request_nowarn(&amp;fw, path, gvt-&gt;gt-&gt;i915-&gt;<a href=
=3D"http://drm.dev">drm.dev</a>);
</span>Thank you!</div>

--000000000000b0b90b0600c995e7--
