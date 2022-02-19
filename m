Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F3A4BC8B4
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 19 Feb 2022 14:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C78E10E208;
	Sat, 19 Feb 2022 13:37:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-x1143.google.com (mail-yw1-x1143.google.com
 [IPv6:2607:f8b0:4864:20::1143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470C010E20C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 19 Feb 2022 13:37:02 +0000 (UTC)
Received: by mail-yw1-x1143.google.com with SMTP id
 00721157ae682-2d07ae0b1c5so93325297b3.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 19 Feb 2022 05:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=lh9laKvOxAaHoz9/q8Wwcp8X1fITwDLOFE3CYV0vU1M=;
 b=QpKPm+PXGN0D+cOr5i0eOaOg1MojZPSsfxh93nEU1N2ytBwETzJyqUTsVZZiAExygD
 3fOqBTTlH78C3Wg9bUBvYm1ZDF3Z/SFa6lm4fFFen0ChHHLAWu7Ew7G9NAc0EYRnYp8C
 7D21Nk8wKCjmPK2kWPNRHb81QeqCI7vdsMIao1g6GbBuE5iTmPcQAOSKCA3xRnbo1EP7
 EBfCzthYrQcdQ1/uSfVRe2p0IpZroDSzlaorG51fXydeC4+Y8tuIE2GsmGvQhM9GImEa
 zTiQ6fs34VYA3cOLESsKDZHL/Nn0YukpCi5rj7OXZ1zTtnXNZDpXr2sem/CnosHyFOxn
 DFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=lh9laKvOxAaHoz9/q8Wwcp8X1fITwDLOFE3CYV0vU1M=;
 b=SwIXpxoSgHKih0bDokwKZquYTqoNAEI/KWg3j9DlotpEUUndvm1cysm/HRij/GBoDl
 /2hMsyIsepHZrJEdoJg1xCcSfxwQNeJ+EGGyPdCe4CMIM1LRhHrzoc08FOI+eAaQlDF1
 Th6Q8ucmuQzzBpkDeBdJQUoiNiL8/jRqhW3/B5KnpSmxpXmNE+mi3C/5rH1jLzwr14Vx
 54iee/DjOUvn3VLuCDzqTkkrIol2HofAatWZEVxOHxJ9hqGDZ1FzLCVWA5OGgoE06vZW
 OyrU9tiOlG9IICMoYh2A97KZrjkLLGq4mNrkyNpK4bCKoj7MNb6uWdtnFC2adClBEIC3
 55HA==
X-Gm-Message-State: AOAM533nWgbRXapTc2PcSJXeH5ZR85fIiGnTJLG1pZMFCwsS07j4sbSi
 UBumSrRMCmsZT7FQrzQvSO1VNQqnZxV03xLhRA0=
X-Google-Smtp-Source: ABdhPJyR/V2oTKgN0zBt7S0G61Xd/Xw0jcBaa/YDLgiLdfngwT5lGM7YgqP0OPeVRKWxh4HWhP9M3kehH7gApr7jACY=
X-Received: by 2002:a81:5591:0:b0:2ca:287c:6c8a with SMTP id
 j139-20020a815591000000b002ca287c6c8amr12191559ywb.303.1645277821458; Sat, 19
 Feb 2022 05:37:01 -0800 (PST)
MIME-Version: 1.0
From: Sarah Lee <elvismcdonald55@gmail.com>
Date: Sat, 19 Feb 2022 15:36:50 +0200
Message-ID: <CAAT7ZTWTYxOLqZ89XJ8hDQYVCPh=-=fbT-+CxeJeUv4N2vZgQg@mail.gmail.com>
Subject: 
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000001adeb505d85f18d9"
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
Reply-To: sarah_lee@accountanthkb.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000001adeb505d85f18d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

--=20
Hello. I=E2=80=99m Mrs. Sarah Lee, if you were marked safe from the covid-1=
9
epidemic, my prayers are with you. I want to offer you a business deal
worth $7,400,000.00 USD, if you are interested contact me privately .
Email: sarah_lee@accountanthkb.com

Sarah Lee

--0000000000001adeb505d85f18d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature">Hello. I=E2=80=
=99m Mrs. Sarah Lee, if you were marked safe from the covid-19 epidemic, my=
 prayers are with you. I want to offer you a business deal worth $7,400,000=
.00 USD, if you are interested contact me privately . Email: <a href=3D"mai=
lto:sarah_lee@accountanthkb.com" target=3D"_blank">sarah_lee@accountanthkb.=
com</a><br><br>Sarah Lee</div></div>

--0000000000001adeb505d85f18d9--
