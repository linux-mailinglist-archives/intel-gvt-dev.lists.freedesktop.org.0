Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFA2399269
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  2 Jun 2021 20:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410A76ED24;
	Wed,  2 Jun 2021 18:19:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1696ED94
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  2 Jun 2021 18:19:16 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id v9so3494405ion.11
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 02 Jun 2021 11:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3BK6A6ZUNSgTWS7GrqqH4NgquHL7zgz69DrVSsqp42U=;
 b=QtbovYiCG21nOiA2JtL4/dBXy0arq6LA9fL1CNkM6fSYNGaOPylipZYx0xbHsFYMAU
 MDNuji7OHU74YttrY+RCMEXy7BbCrJKX7/NNMHsvXzJF3H5/Ix6XMrpfGg6RyIJMpScg
 duHhFGokPqcCwTgyKHWgKZDssILwUbnhtDi18j5qthkBlLFP1QF6EVUw2kTt1L3zOEXr
 orarpx4YlGdW2k6qIAE73pTE0f+RHjZfzLpeTGjg3r6AArawsL141BXX7ILPSThslmvD
 Qqj/JXofLwJT7+V+hKbaIpsCf4pa8wmYrGc7xERYbAdYz5CEveua1S/biS5HTPUa/19L
 nZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3BK6A6ZUNSgTWS7GrqqH4NgquHL7zgz69DrVSsqp42U=;
 b=JPHeNkVaFqlhQFtgg/qod2mezNektC9ukYkJrZ/phxJGshoED6xon0AwYunmTRtaoT
 1CE8M7IWl1BM0GKMbBpYjJrzEKp3D50xv9dHXQYoqqEgwlY2XvITufmMVy1aaoN8stny
 SugwiT9QppTUCqL7Z4s24GF1W88N3d5oPwRsfvbHBVzTJFXDmsGBZ5ki/SVbJCU0PT52
 7VsrzsWQbNmaaKm15v84o8OOMiU7o2On/drrvqARJ68IN//NhxnXcQHvLWdjv7+LZTpv
 M0JK85sk7w98TpqFRR0IY9KNnBAJUjpVRJoeaAPbeSTwrVWGfI32tmUWBIkWYfv5dqZt
 Tx/A==
X-Gm-Message-State: AOAM531vk2Rtd7VbKSAtQ5RM04bG4S4iwETLdOjZa6K32wwaO3zKcPJY
 UrusM2v1zfZrLMu8vLTOXTHIantjONyj2zQ343I=
X-Google-Smtp-Source: ABdhPJwvaCyVYXLMSfgKZnZxZD0DiU2pT9ARx3h2RBjUgQNCtFmeie5B7ljAvJnXga5iPZfog+I4QI5+KZcypdJH1K0=
X-Received: by 2002:a05:6602:2f0f:: with SMTP id
 q15mr26868790iow.75.1622657955899; 
 Wed, 02 Jun 2021 11:19:15 -0700 (PDT)
MIME-Version: 1.0
From: lalisa santiago <lalisasantiago1@gmail.com>
Date: Wed, 2 Jun 2021 18:19:12 +0000
Message-ID: <CAHUb6j4Z9z4vpE4wnntY-QfbV4HVczOp-dE0Y_ecpFENgJ9YwQ@mail.gmail.com>
Subject: hi
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
Content-Type: multipart/mixed; boundary="===============0259931180=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0259931180==
Content-Type: multipart/alternative; boundary="0000000000000db24705c3cc7fee"

--0000000000000db24705c3cc7fee
Content-Type: text/plain; charset="UTF-8"

Hello, Can we be friends? If you don't mind
Hi Dear ,
My name is .lalisa and i am single
Please reply me at
lalisasantiago1@gmail.com

--0000000000000db24705c3cc7fee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Hello,=C2=A0Can=C2=A0we=C2=A0be=C2=A0friends?=C2=A0If=
=C2=A0you=C2=A0don&#39;t=C2=A0mind<br>Hi=C2=A0Dear=C2=A0,<br>My=C2=A0name=
=C2=A0is=C2=A0.lalisa=C2=A0and=C2=A0i=C2=A0am=C2=A0single<br>Please=C2=A0re=
ply=C2=A0me=C2=A0at<br><a href=3D"mailto:lalisasantiago1@gmail.com">lalisas=
antiago1@gmail.com</a><br></div>

--0000000000000db24705c3cc7fee--

--===============0259931180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0259931180==--
