Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C06057A711
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Jul 2022 21:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B227E10EF00;
	Tue, 19 Jul 2022 19:18:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oa1-x43.google.com (mail-oa1-x43.google.com
 [IPv6:2001:4860:4864:20::43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB1D10F2E2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Jul 2022 19:18:06 +0000 (UTC)
Received: by mail-oa1-x43.google.com with SMTP id
 586e51a60fabf-10bd4812c29so33222349fac.11
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Jul 2022 12:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=7zx/9bFP3n6pass+ta95ji6KmmvS6TQSNe6FjvADhlw=;
 b=hHHbKUreey76ZN5NqJyZLH9rMogCgLq5DofohEwqumsiaGkMy6QXkJCQGInEpyYvW/
 8bDlAczhIhKdobwmRiuH64oo+kvoMOVcXHD+gTVc/fPrtaa4MlLn+7GIL3AGD0xSC2Sc
 uBhMAdKjJyti6fJKKo2EUpIGvqiwyQjCG+NiRXfcpsdd30OrF5ZiOjjES9+5Em1PLjnN
 KRtGDwJhdlB9pxDiyHklqTzCBaJFmUS4sBMpYPyyXICp/zsB1AtgLby5sdVEWnVwY/PH
 Bxu1vQ4iYAQ8Tzx1avYot8VukdsCfENjBWcpBTd4uGlRLyCUJWLQ8IAv1UO8vyeoPgYe
 0L0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to:content-transfer-encoding;
 bh=7zx/9bFP3n6pass+ta95ji6KmmvS6TQSNe6FjvADhlw=;
 b=WvMomT7kih8hyHajZa4F8qHtDG8Hq/1wY3pjb6BZ1O7CSjOVeQOj72+HNdH6srGmxT
 ApS/pfGeoygv1FKMNR4p7QgzOkNMjR0Bn5pvMAR/pIrV0FLwRjYmOXh99wBV61uYHVz/
 2Zy5kPcyLhth1xfMg/V2oCIqLTUU/TPiM4j7MapQsNbVz5Z06gqITJA1sjTOyHyFgUB7
 BVSrwYm5yntpVJJbPdVOYjlHuNlkW8dZ3ADKnR1JJy2gjxoq1k8aMEF/VY7OYsNEoql9
 QkGUHiYKqBsuOIK7eCWAxc+LrJ20bibKbvw8nm5kBqIYXn5XFC7epkzIYAeCvw+xITUu
 k73w==
X-Gm-Message-State: AJIora/0yXGRjIu2XMLyP9rZusP2EViPROVmKE9AI9K+Qa4lSRMwd/zu
 4yLd1M7FrfylrSB3OQrHq7d3PkPCpFdQwaAuiQo=
X-Google-Smtp-Source: AGRyM1v5Dkojg9xxG/MZwSiGjatoSSpaEaOPnzFryUTC6OA57tRnHAcg53p/b/GC1HhgL825quzGAcEb9mH+3SFi+7U=
X-Received: by 2002:a05:6870:3290:b0:10d:7e26:8f0e with SMTP id
 q16-20020a056870329000b0010d7e268f0emr562818oac.78.1658258285718; Tue, 19 Jul
 2022 12:18:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6850:7a09:b0:314:6f3d:d9e9 with HTTP; Tue, 19 Jul 2022
 12:18:05 -0700 (PDT)
From: "Mr.Omar Arouna " <salifroland@gmail.com>
Date: Tue, 19 Jul 2022 12:18:05 -0700
Message-ID: <CAHFOAy3j6BGyKH13KytV11z=yPxLUEiDdVDh7gcMs8qtmo-FEg@mail.gmail.com>
Subject: good evening
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: omar.arouna500@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

good evening

Dear Friend

Please

my name is Mr. Omar Arouna from Burkina Faso and I
work with  Bank Of Africa (BOA) as acting head of finance. I
contacted you in good faith and I am optimistic that the success of
this transaction will go a long way to uplift our financial status in
no distant time.

However, one of our deceased customers from Malaysia abandoned the sum
of $11.9 million in our bank since 2013, and according to the financial
act my government has every right to confiscate funds in unclaimed
bank account/unattended after 8 years, it=E2=80=99s in this regard that I w=
ant
to commission this fund to you so that you will stand as associate to
the deceased customer and claim this fund from my bank after which we
will share it at the ratio of 40% for you and 60% for me.Please

you on how to apply to my bank for the transfer of this fund
into your personal bank account. I hope to hear from you soon.

(1) Your Full Name,

(2) Sex and Age:

(3) Country of origin:

(4) Residential address:

(5) Phone number:

(6) Occupation:

Best regards,

Mr. Omar Arouna.
