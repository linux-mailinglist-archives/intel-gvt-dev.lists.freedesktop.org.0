Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC583A2E417
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Feb 2025 07:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D350A10E187;
	Mon, 10 Feb 2025 06:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SQ0dAM2g";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3781110E4A7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 10 Feb 2025 06:20:36 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5450f0b0a4fso39192e87.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 09 Feb 2025 22:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739168434; x=1739773234; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+c+eis5n7mDWeqhGOhsNDOwrK8l7ePWxdiIU79gygsg=;
 b=SQ0dAM2gA8gnGOFx5caMpDNjmrUGLoPpR6JS4uGmOvgFb/qjQmjgDEpAawZIS4qtJ8
 xi2vgfWocyW4HBE5nn9+Omv8tS3kfKz13C+7z49H7i7AGbv+jxQaSxsu/L9sRl5AD2b4
 KT7I6+KvJjF5CWSICAGpKhwkHikB25J5yzvNCg//hFSi67tTiXZ6UnrO3oq9vRHbO59u
 9VNpE7hLT7uaOzjyXiAK8y09Zk0WyNXBferN7RXXlvwzOakmf2t68nNlERmHBExpewkT
 aSAY+ZTg+Ctin3rXiuUMXAdQ3r+uj6LtK/6aQ1o4kgBEhXAvISxfwbLCRGHL56oVzYNu
 oQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739168434; x=1739773234;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+c+eis5n7mDWeqhGOhsNDOwrK8l7ePWxdiIU79gygsg=;
 b=MdcH8nx1y2/iw4Lv40M+mkU+9yj5Sgw1E4VSRrL3M4DDK0ldOGoH+6+9IZWgY3YK1k
 +5Xb4O2nlxH5yU7x8j2y09CUO2uPY9++z4dXh2nCi3FZOkhVmkF7gO04+8hIWP8Y1eGE
 ogmGieQ6+1/fFTB7bSFS1sgv0uxHZX3RXnCsSpp3HYKqrLlQjjv1w1kqsMNN9Kuzcjtq
 qyBu2J/MYjWReCcTyWiyD4nfXagepBcn/xe55KCdoBdsM3+fNP503umAtpX/YV6j03T3
 k8Jqw55jN1IJW1Qe0xdw8LmqEpc+QZzH7MLvcky02Dn+99a0uUzV6WQmZKMHM7rJ3YtC
 OYxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw4d3/LiOOpWdU9/wywmdPfNnTnr2W7JueTqmI48D0nq1YDHrc7P4rjfvhCa98i6iqNUfzCnhcMaFbCnVl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL6QJir27ptk/u/aizDdLDZ1dAbMbIshQo+Y/Mvf4PN1oyPj8l
 QK+qiuy/MKVjIJ6m7+bnkdIrQYKu842quie/7a7M1Jct9CO0O3mWH2j+Jjuc/kIZqabZ/CM9FPE
 SzQYTmqcX4UPdCUO5pDxwjrSyEnA=
X-Gm-Gg: ASbGncvjfb45U2zDk+HkQcLoh7iPdMZj8bSHOvH9sMfY6lwCkBvmnDEsJuMNuxydQKc
 ry2CR4KMWcJVrwpv48kEy5KykBvil19JdDiqcn0l+3PSznQrtEvTmVyw2yNiA1n8mCztUym6vx6
 8=
X-Google-Smtp-Source: AGHT+IHaG1jo9N/KwdReJL+fFMxeIgsa1YbAnYWc4PJnQ40Rz6VYfo5idE4xsHf0jjfcj3Ejqv6sDV5j17AYrIo8In8=
X-Received: by 2002:a05:6512:3b25:b0:545:bb6:89ab with SMTP id
 2adb3069b0e04-5450bb68aa5mr353965e87.6.1739168434153; Sun, 09 Feb 2025
 22:20:34 -0800 (PST)
MIME-Version: 1.0
From: Changpeng Zhao <changpengzhao39@gmail.com>
Date: Mon, 10 Feb 2025 08:20:15 +0200
X-Gm-Features: AWEUYZke6RS4YQgD2tYLiK0tHfeY3J4BmfbADh1OcKBzXhPvwYAOODxbmBwf8S8
Message-ID: <CAMLY9+OGZ9YJRzQn3SK43XGroP1LaQ7erXdabYaU+Y5oij9y_w@mail.gmail.com>
Subject: 
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000b8f208062dc3b43c"
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

--000000000000b8f208062dc3b43c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

RG9icsO9IGRlbg0KDQpKYWtvIHR2xa9yY2UgQmluYW5jZSwgQ2hhbmdwZW5nIFpoYW8sIHNlIHbE
m251amkgcG9kcG/FmWUgemHEjcOtbmFqw61jw61jaA0KcG9kbmlrYXRlbMWvIGEga29tdW5pdG7D
rWNoIGluaWNpYXRpdi4gTcO9bSBwcmltw6FybsOtbSBjw61sZW0gamUgcG9kcG9yb3ZhdA0KaW5v
dmFjZSBhIG9iY2hvZG7DrSBzbmFoeSwga3RlcsOpIG1hasOtIHBveml0aXZuw60gZG9wYWQgbmEg
c3BvbGXEjW5vc3QuIFNkw61sZW7DrQ0KxI3DoXN0aSBtw6lobyBib2hhdHN0dsOtIHYga3J5cHRv
bcSbbsSbIG1pIHDFmWluw6HFocOtIG5lc23DrXJub3UgcmFkb3N0IGEgdnlicmFsIGpzZW0NCnNp
IHbDoXMgamFrbyBqZWRub2hvIHogcMWZw61qZW1jxa8sIGt0ZcWZw60gb2JkcsW+w60gMzAwIEJU
QyBrYcW+ZMO9Lg0KDQpQb2t1ZCBwb3TFmWVidWpldGUgZGFsxaHDrSBpbmZvcm1hY2UsIG5ldsOh
aGVqdGUgc2UgbmEgbsOhcyBvYnLDoXRpdC4NCg0Kc3JkZcSNbsOpIHBvemRyYXZ5LA0KQ2hhbmdw
ZW5nIFpoYW8NCg==
--000000000000b8f208062dc3b43c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dobr=C3=BD den<br><br>Jako tv=C5=AFrce Binance, Changpeng =
Zhao, se v=C4=9Bnuji podpo=C5=99e za=C4=8D=C3=ADnaj=C3=ADc=C3=ADch podnikat=
el=C5=AF a komunitn=C3=ADch iniciativ. M=C3=BDm prim=C3=A1rn=C3=ADm c=C3=AD=
lem je podporovat inovace a obchodn=C3=AD snahy, kter=C3=A9 maj=C3=AD pozit=
ivn=C3=AD dopad na spole=C4=8Dnost. Sd=C3=ADlen=C3=AD =C4=8D=C3=A1sti m=C3=
=A9ho bohatstv=C3=AD v kryptom=C4=9Bn=C4=9B mi p=C5=99in=C3=A1=C5=A1=C3=AD =
nesm=C3=ADrnou radost a vybral jsem si v=C3=A1s jako jednoho z p=C5=99=C3=
=ADjemc=C5=AF, kte=C5=99=C3=AD obdr=C5=BE=C3=AD 300 BTC ka=C5=BEd=C3=BD.<br=
><br>Pokud pot=C5=99ebujete dal=C5=A1=C3=AD informace, nev=C3=A1hejte se na=
 n=C3=A1s obr=C3=A1tit.<br><br>srde=C4=8Dn=C3=A9 pozdravy,<br>Changpeng Zha=
o</div>

--000000000000b8f208062dc3b43c--
