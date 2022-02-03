Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B554A82CF
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  3 Feb 2022 12:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D0010E204;
	Thu,  3 Feb 2022 11:01:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D089F10E289
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  3 Feb 2022 11:01:52 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id m10so3517086oie.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 03 Feb 2022 03:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=7N7h5sp+C7D9T3rruJ+fWyc/bmRNeSMemy5KwXYOh3k=;
 b=OhLAcFEjqA81EB1G3hL9kNrDM9sL/WBl7Gim+hlLuhie0ruBfBn1xEWhtJWb/G1t5N
 4rprN5pPNj6iCzrx6GRGtw+wrglUQbCujnSxKjc7ldQ8DEWcxSZ8pT7QYDD6oxLSqcWo
 /VKFz9ndfddzED1fxd1/Fko6hGSKOuq/VzpQB6wwCNTb1nFjVFMQbiFQWzVLQfZdg1vt
 spkmVed9hINS0/EpW+m421dCovV469lpjjDe2cyAm8SKNOpppgXS3iKr8uWkV7rlN7aY
 ZvHuzKAVvZmgnfH0f9qhRDQb8czr2DzfmiaUpka50f9JVo6eTiEqiGS1ee5eCCe48zDp
 K58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=7N7h5sp+C7D9T3rruJ+fWyc/bmRNeSMemy5KwXYOh3k=;
 b=ZOFVOLgsnKzJ2zrJiZHkSj6GkwxOF5sOSWXGa1Mzn0NoZpXFwh0ln3PCHmJ9pVUiTX
 4O/XsahEhgW5Bmsx6geIobVLtkGg56MCulIO80blohhfesPTPgw91JfK+Wdutdu/PPDm
 XsF7eCb/9J6UqdUelvCID8lSnBQrbwQolG4O9YSoEq7lVjrghr6C5g7l0ajTC8b+OTGB
 xXIwshElvEcCrk5UcasKsB16IybMVinC5Kd5LCFsCnZJe17nUh7F4+zOGvcwbRIvmNEH
 D4OpX7uMdAn0v7795lNc2/abDpg2inE54GXI56kn/Ye9z+ugdLb2Mjf4oCXRFUJJpq14
 627w==
X-Gm-Message-State: AOAM53196qaESM7H1q879KIOiCwxi+up0NIitam8DZQqtdYnX/KK1V/U
 WnT2lhBYLPaPxKowUkDyVJ9kwRGJCgRI79V4YB4=
X-Google-Smtp-Source: ABdhPJwJ8Jx2oXCCoBS4tvQdoGJxqSiSVaSkiegG7oVCSjsxLxRvB7LXB/OYL9bjjcEyxO/m9JZGrBVQbS2ORt/GGKQ=
X-Received: by 2002:a05:6808:2223:: with SMTP id
 bd35mr7388157oib.183.1643886112089; 
 Thu, 03 Feb 2022 03:01:52 -0800 (PST)
MIME-Version: 1.0
From: Alex Brazier <contactalecssandrokonart@gmail.com>
Date: Thu, 3 Feb 2022 03:01:39 -0800
Message-ID: <CAO9K7Kj=vakJE_hgtvJPD6mBpp5O979nZZHcMdrTDL5ZMDzAXQ@mail.gmail.com>
Subject: Hello
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000c32aa505d71b0f9c"
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
Reply-To: brazier.ann@hotmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--000000000000c32aa505d71b0f9c
Content-Type: text/plain; charset="UTF-8"

Good Day,

There is an important proposal found on your name, Kindly contact Dr Alex
Brazier through email for more information.

I await your response for details.

Regards

Dr. Alex Brazier

--000000000000c32aa505d71b0f9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Good Day,</div><div><br></div><div>T=
here is an important proposal found on your name, Kindly contact Dr Alex Br=
azier through email for more information.</div><div><br></div><div>I await =
your response for details.</div><div><br></div><div>Regards</div><div><br><=
/div><div>Dr. Alex Brazier</div></div></div>

--000000000000c32aa505d71b0f9c--
