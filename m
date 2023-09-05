Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FE879320F
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 Sep 2023 00:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9940410E321;
	Tue,  5 Sep 2023 22:42:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C2110E529
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  5 Sep 2023 22:42:08 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-26f6b2c8e80so2176346a91.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 05 Sep 2023 15:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693953728; x=1694558528; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=D8F/kqBZ5nYikJJKkCpjCG8ch9sWe29Nh+xZaxYIfkw=;
 b=Y41k6x2byG0DY1z+sTAbiR9KUZODLDsdZgucFfTMhfAZa9KFBJJrrefgG0WqR0JUtz
 e5YRq9fIMWcbUuNrqcs+VkpdYHdFrDl37rluneAoqTYG0qnzxTxrHmhfr0M0mrD3nRfe
 pzsPPoKVmdZBKMw6Ul00uOgsOicDr+8XKS1rBLp6ffVuIq4XZjQQuGf314LEw5ojeqme
 oLFINHhuRYeoADtNqqIz2MO4/OVRLK4Bmnwj86I2YD8fElwyKQAoI2NB6OnDF3Qkoopc
 4+SaxcqZNSg9C9Wm+wtfiD3rgQVGibTvgTfuoJiUm3JiDzNvZ1BcqJhQwBgV8Dck4Yd0
 BKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693953728; x=1694558528;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D8F/kqBZ5nYikJJKkCpjCG8ch9sWe29Nh+xZaxYIfkw=;
 b=UzrmoywMjR7MlZ9kphRSvOnqAiiNe5Qokxlo5UhOCuWbLl/ERfikwFHClHMFZyYDOy
 uv838LqCtPU2uc1PH4pYfenzYtGrBt2yxDWRg3TonbSWR4/DFfnKPkF32jHm7UCzMxXW
 MEtIemjhslLe0YnecF3w8cMSMncEPzmyS2yTlDFl60QqMhpS9tpxi/AqU3CSBC2UEiq2
 R6VkxANPjInxJ3/anaTimW4oYH13CCQ1cLeG5RXSluE9EcOjbnffF2/zMbt+qomey0EM
 ubaTk9wuGjTtInFAodi9r8GEeDyM6Q0ocwvNBR/P/WsjzvuXnY/ByXThTsAsmfsRsq+k
 4/zA==
X-Gm-Message-State: AOJu0YzlcqNmyhsay2u69pGFlNsDJPNLqW/EupoRSOsSfX8DgJUgcDdZ
 7n1UxFRz4Y/nd8BFCFD4FDZWBmBeTIr6C2K5krc=
X-Google-Smtp-Source: AGHT+IGZntTBkHPsViLnxt0e78bm/py5aLUVOjZ6rR8GrOtIbA2EFjfebs7+wSaWsca8lLDPYpJ6KhAdnBNYneqfzJg=
X-Received: by 2002:a17:90a:17ca:b0:271:c207:b285 with SMTP id
 q68-20020a17090a17ca00b00271c207b285mr14281340pja.9.1693953727746; Tue, 05
 Sep 2023 15:42:07 -0700 (PDT)
MIME-Version: 1.0
From: CAPTAIN Anne <edward561962@gmail.com>
Date: Tue, 5 Sep 2023 16:41:56 -0600
Message-ID: <CAJyP9Kq7ZJROLoRBP9Yhxzh7GBgCP07fa4Goeq3m=4BgGoJc_w@mail.gmail.com>
Subject: Hello
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000003557a70604a45629"
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

--0000000000003557a70604a45629
Content-Type: text/plain; charset="UTF-8"

.Hello!

I have a confidential proposal deal for you and it will benefit both of us.
I am CAPTAIN Anne US MARINE.Reply to my private email address or send me
your email address so that I can forward to you the full detail of the
proposal. Here is my private email address:{captainanne08@gmail.com}

I await your quick response.

Regards
CAPTAIN Anne
US MARINE.

--0000000000003557a70604a45629
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">.Hello!<br><br>I have a confidential proposal deal for you=
 and it will benefit both of us. I am CAPTAIN Anne US MARINE.Reply to my pr=
ivate email address or send me your email address so that I can forward to =
you the full detail of the proposal. Here is my private email <a href=3D"ma=
ilto:address%3A%7Bcaptainanne08@gmail.com">address:{captainanne08@gmail.com=
</a>}<br><br>I await your quick response.<br><br>Regards<br>CAPTAIN Anne<br=
>US MARINE.<br></div>

--0000000000003557a70604a45629--
