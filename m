Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12AD3991EB
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  2 Jun 2021 19:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A822B6EE33;
	Wed,  2 Jun 2021 17:47:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD086EE33
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  2 Jun 2021 17:47:40 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id h9so3467730oih.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 02 Jun 2021 10:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=JZ1D4cNiQkaxv+2J/x+4mAOGjRVQgvayEJSvA4UHXbs=;
 b=hoUZRktg48cjEDaHURrOjFnnKQnpCfKIsg7MGtLxlvgwlrytsMZ53oOiS7+hqfy+Rn
 NZPzf51ne5THGW1rDzSzWvbcH+4UjBA9SjifuQP9dyY4xBxjjwZV7DPx36g7tXwOabmP
 CFi9azbKuEJe7LwTGke8zWzoWhrDOZVcvDOVzM7NrMHvnRiFBozj37Z5+LVhlY+i1oc8
 +9JtK4Q7zICIBK7JpjaQ5sWA9/UsClPtuZWnnKRaj3nBYfbuitWKQ/Qy3go+RKwCK44c
 VK5iEgnXXYirYkZWi07gopVFUacG5oqDArEZiVJHX7NQHRdebolaF0NIIQNx3bP4TAi1
 yUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=JZ1D4cNiQkaxv+2J/x+4mAOGjRVQgvayEJSvA4UHXbs=;
 b=Nyo50e5GJ1eR+YpU3xIpubH0qcC1oIcr8thKqd6a6c8+yQKeQuygsstS5vcWQavUew
 Tgl+VDVpYzrtDYA8XMkghHB7czICiQ5wo9/l3BBh/np1ZRrD29F1autCzv1DilHtDV6Q
 PeF0XNv6DNXuu5q+OgUJsAdDKzRkiebr3vTdT7dqcGQeJoMm4CKhXaP8YUy2gZ4G/HwN
 +3USa8FeJG/4/XoAaLdjSQZzD0JBbLReliiDqZ3re/KOzmlWR/x2drhrD4rn9IOeiHCA
 1bMI2M/0aPHyHsyFfJt/SL1NK3yynB+IKWhbbVTa0cysbkM9A2WjRBxLyBTWncMxxtm8
 28Ww==
X-Gm-Message-State: AOAM531UhIbUcEIxp8Rn8w8aGK1Y5KEeAdyxWdXeypCb/hDnDrudLehn
 v9lCMvu0NNbgoGRpxtvMD+W6v8dXxVwQcgrfXRw=
X-Google-Smtp-Source: ABdhPJxXkA56DyLB5RAHFtQMSjhXyjM/ODhLUes20HKy9XPtX7MU+DkjI0Pa6mwklmAsOqL/CtXtJwHwhTVQDibNbAo=
X-Received: by 2002:a05:6808:13d5:: with SMTP id
 d21mr22585503oiw.31.1622656059536; 
 Wed, 02 Jun 2021 10:47:39 -0700 (PDT)
MIME-Version: 1.0
From: Nelson Bile <nlsonbile@gmail.com>
Date: Wed, 2 Jun 2021 17:47:32 +0000
Message-ID: <CAO9HbhikSNACYdscZy-2z9cHu1P3vAShP+f-zCe6_zGdH7CDVQ@mail.gmail.com>
Subject: Read & reply
To: undisclosed-recipients:;
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
Reply-To: nlsonbile@gmail.com
Content-Type: multipart/mixed; boundary="===============0595196865=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0595196865==
Content-Type: multipart/alternative; boundary="000000000000057b0b05c3cc0ece"

--000000000000057b0b05c3cc0ece
Content-Type: text/plain; charset="UTF-8"

Greetings  my good friend,

I am Mr.Nelson Bile, Please confirm to me the receipt of this message.I
have sent you this message many times but couldn't hear your
response.Please get back to me very important for more details.

Hon.Barrister Nelson Bile,Esq
Bile & Advocate
Office Address: 603,Rue De Ibis Bp.13364,Lome-Togo
Lome Togo, West Africa,

--000000000000057b0b05c3cc0ece
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings =C2=A0my good friend,<br><br>I am Mr.Nelson Bile=
, Please confirm to me the receipt of this message.I have sent you this mes=
sage many times but couldn&#39;t hear your response.Please get back to me v=
ery important for more details.<br><br>Hon.Barrister Nelson Bile,Esq<br>Bil=
e &amp; Advocate<br>Office Address: 603,Rue De Ibis Bp.13364,Lome-Togo<br>L=
ome Togo, West Africa,=C2=A0=C2=A0<br></div>

--000000000000057b0b05c3cc0ece--

--===============0595196865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0595196865==--
