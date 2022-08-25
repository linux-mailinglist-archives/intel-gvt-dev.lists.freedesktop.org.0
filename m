Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC7D5A0ECE
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 25 Aug 2022 13:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF7410E547;
	Thu, 25 Aug 2022 11:15:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0CE10E355
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 25 Aug 2022 11:14:57 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id n15so6680893lfe.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 25 Aug 2022 04:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
 bh=fpUsgXhu95gzuSkES4DDfmvhG7++gMqdfB31o/zY+xk=;
 b=eclQs1gBk3oxaelJUT3ryUOO5Z3XWy3DFjs+/AO+UqFaRledS4fl9YiJDFPoTJptdG
 PaiHjzVDZoMc4wHq/1ZihU6lrjgpI+8hkMUw/DqY8cSKEh8NsGrw1TrtmBjIEiEKjwDZ
 o8eTe+1L/og3wW9p0vFHP9hKGN3dYdBytgbCptXHP8Dh1juQZaFwvQkZ8ihvEBH96YAB
 wIN12omgXNdU24I1zvVU+4WPc+CfUDLw1VUaGJx9Rjqyh1sIzV4UHpBsHtbjkVAUmxRZ
 lUv6HQ8IX870R9dgHDdnKrxg0Em7udNju3TFBpN9iiqE7ujPRSWKgJgGS7PODoqEP/D8
 qOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc;
 bh=fpUsgXhu95gzuSkES4DDfmvhG7++gMqdfB31o/zY+xk=;
 b=j2Qvvk8KCmsF9reB1zNcH6XUTdlTw0kj8eGmJ5ioAW4J3nRVEyLRmP93octUgpt0i/
 KJnSjmQeB36qUsBIFSn6Z/b84030NDQb9abyPTVMvkymf447QtuSMF3S1FLIglk0Rkz+
 Y7eYq3qH8le5iNNBy5vcz+JNkdmsscuCenE60yD8qeGXAOxLYAj4o45yhI18oC5kEW35
 P4II/ZUKViACkbH7unDjJrsTyLSopJQwK1ibXF3Wb8XmHA+ZShShxbYqHM2uFUJi9nWR
 H38IoS825ySxbPxBalGIpc2U8+Gw3DHQtPPDf38kdCVNlqycR4S55jlrPGoL8MfRfyDi
 3CNQ==
X-Gm-Message-State: ACgBeo2ocrFgWSe2lfvK6L1XyLMCO+wDKt8sbQHdgTUAHjJDQGCM8tMI
 9ZVQBs9GjMwiT2hHcqQ2KFpQKNEWM2HBB2dKpBg=
X-Google-Smtp-Source: AA6agR6AlFICK0gBTrWWAUnq1SVeRaUxAt/ACZaxT3GDkqslnNjlKrwZ23z8tGxL/vjFhv8G6fqANSwrpRLBRO4rr/0=
X-Received: by 2002:a19:670b:0:b0:48b:a108:e707 with SMTP id
 b11-20020a19670b000000b0048ba108e707mr1070270lfc.474.1661426095816; Thu, 25
 Aug 2022 04:14:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a89:98f:0:b0:152:6a6b:7d54 with HTTP; Thu, 25 Aug 2022
 04:14:55 -0700 (PDT)
From: Miss Ayesha Qaddafi <lataelizata111@gmail.com>
Date: Thu, 25 Aug 2022 13:14:55 +0200
Message-ID: <CAMYAS0cAi5Q85psVadNqvM5Jq6y6p=bfzMx_KN1yafiWZ+4RTQ@mail.gmail.com>
Subject: hi
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: ayesha.qaddafi@yandex.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Dear Beloved,

I am Ayesha Qaddafi, I am writing this mail with tears and sorrow from
my heart asking for your help at this time, I got your contact while
searching for a trustworthy someone who will understand my present
condition and come to my rescue here in Algeria where I am relocated
now to Oman, I have passed through pains and sorrowful moment since
the death of my father and brothers, all our Foreign and local
accounts have been blocked and we are not allowed to make transfers or
receive money from any country or source.

I received an urgent email from Oman government who stated that the
new Libya government are tracing hidden deposit of my late father
which he was deposited with one of the bank in Burkina Faso,Then i
don't want them to be aware of this particular funds ($35.5 Million
dollars) deposited in BIB Banquet International Du Burkina Faso. If
you can be of any assistant to me, kindly get back to me so that i can
furnish you with the full details and the full contact address of the
BIB Bank in Burkina Faso country to enabling you contact them for the
final release of the funds to your onward accredited account in your
country. We will share the money  50% 50% has equal between us.

If you are interested kindly contact me immediately and always check
your email address for more details from private my alternative email
address.

Thanks and may Allah bless you
Miss Ayesha Qaddafi
