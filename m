Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06938987301
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 26 Sep 2024 13:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C9010EAF3;
	Thu, 26 Sep 2024 11:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mbLpIrdi";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A568F10EAF4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Sep 2024 11:45:13 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-49bc1b1368fso541515137.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Sep 2024 04:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727351112; x=1727955912; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=neAf9OjqP/TUsWruzS7195l0Hyoh1eeGLZKPsJ++Usk=;
 b=mbLpIrdihCuKkVr+nsZPV2tG85WDjI75yOEZaJsQ+i0ZLyGtAahvtTms11aX3SkNp/
 7w3BWq4UG1T/MaFh7E51uEAY/z+ItAkCC+UI+UvKYfKvDtUe58Yjz9bh1wiyC3zmWmJ8
 lDzZO5zuMvBqADo3qVU744EwqcMWlv2pFy2FistlH/olV896Mbq9F2+otg3GuPklAOFe
 u+doV5ozCjkHfra2p4lo+RQ5MKGfS5Mvky7XGp4DlnryzspGO1VqquBghC+9zLVdU37L
 LaWE+AKanGOOq7AeqXGrywIfNCQInXSVITbGpuFlzzeo5sCWKJCuvaQ7tomOk62QhDx/
 7Nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727351112; x=1727955912;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=neAf9OjqP/TUsWruzS7195l0Hyoh1eeGLZKPsJ++Usk=;
 b=QIrlBDTT2IGLlYKKAkbyhNPFWUxPT2FhysJ43aTTtPo+RVhnQk7lGqmChyZGVuBh93
 R+Ok/lOYFaSqyzoM08X3F19mHrm3DGbiNxGU8RtuHxMZnt2a7LW42QCtsiVqYnqFs3KV
 BqELun7UuSB93Qx+k7hl+iIgrM0XRmjybFkRpVZDpR96nKPa5YbL9pbJIgvOKrslPDjh
 WxcPAV/QTVw3SjkJyuOYk5hvHynu8aFHPHHGlZggD8fRukVK8JVKNahaB9oDT8nvSSkj
 Okpoqsw0o4O81iEReoW7QIkVodeTm9ZkJCgm1GaF5cvqQp2wxSPym8OrTlZYDv47n/XO
 bhdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIsXA5R3TySpbOjhkdXWB5Fox5NLA1Uzh6whyQF5lVfnbKQgzevelihD0jKzvaNTDvhYcPZnTvLUkBUQCk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxK47FPU67vn3c8lkXL635NWtSRUZdpS1YQgWpwhjIEVZ8S2mEP
 ExH/9cIYI5shcGbGRSpWbmgIpjCXf5I3JLN5LUelnhIA/8yqBOVOhi0jouxvkxrW4gQbSCWOEOY
 9yVVv2BlB4CBuLxwMgitSxK5qrbg=
X-Google-Smtp-Source: AGHT+IFyTLIwZV/dYntpPChVngaOary4+DzdJR9U/fbmRhNU7ANIhJJXtuu6/XH0//HoA1inSFmjjXu7fd7X9IVHvlo=
X-Received: by 2002:a05:6102:5111:b0:49b:e4eb:37d2 with SMTP id
 ada2fe7eead31-4a1772daf28mr2108451137.11.1727351112269; Thu, 26 Sep 2024
 04:45:12 -0700 (PDT)
MIME-Version: 1.0
From: "Mr. John Robinson" <jhrobinson1956@gmail.com>
Date: Thu, 26 Sep 2024 06:44:59 -0500
Message-ID: <CAKBmgeuX4Bdy+4prg=goBvcr-Z9A_McUWURdTAwNSmbDfK2Xrw@mail.gmail.com>
Subject: Donatie in geld!
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000007306f30623044567"
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

--0000000000007306f30623044567
Content-Type: text/plain; charset="UTF-8"

U bent de gelukkige winnaar. De som van (EUR 1.500.000) is aan u gedoneerd
door de heer John Robinson. Reageer op de e-mail voor meer informatie

--0000000000007306f30623044567
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr">U bent de gelukkige winnaar. De s=
om van (EUR 1.500.000) is aan u gedoneerd door de heer John Robinson. Reage=
er op de e-mail voor meer informatie<br></div></div></div></div>

--0000000000007306f30623044567--
