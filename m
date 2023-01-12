Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E7C666B6C
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 12 Jan 2023 08:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B7110E885;
	Thu, 12 Jan 2023 07:11:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0AF10E885
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 12 Jan 2023 07:11:39 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w14so8260777edi.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 11 Jan 2023 23:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kzSwHk1SaylGnC8Ss5N6VJ4ASCeWSPBADqBe/baWn5I=;
 b=XsuHF1q6/KZr4aFa9VCTCP1WK387XmzvQHCjXOD8pxTzI77Mwc2pnmu3h9X2B8m5Pw
 iWg8lMwPHgKiVVf36OKrpL3aW4h0RfJcF5R6bEmbPdgYQ6XouOGmv/LO6A305nGpOzYk
 wJwB/3F0LsTJsvmZ/AAA68ki9mrdTiGdvYPTpvKn8J+hXMTl2utg61OQEPojWePTe1JK
 aYE7j1iA63aXmbCw7oARH9pJkUTUxSucEky0iX2AVtD9G7YWz6FMZ/1G/a618EJmNlk4
 DmCQ59ZzDvXeW/f6uNXB1sK+IQIUHv16DT98Q/PamO2m6072TsIuNstXLvJHfHLaSsWd
 57Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kzSwHk1SaylGnC8Ss5N6VJ4ASCeWSPBADqBe/baWn5I=;
 b=PzWAtdeDfiRfhnpgkGM4Ln2uR+WuqA4xzmXa/ZdQD0UxqmbxQz2EyIOgY2P7tv/l7z
 A9dUQoFNzI2zc7fMYilJIpOTFBWkH2JKPhjAwb4Ms70LzJEN9KykoVY4iCNh486a1y69
 SdiC1mjt5Gl/5X5O0xseirN6XMgkaXN5hLvKTmiGBjBSEGlyfxGmkhdQlaNzpDLZc2Xv
 B3ZOexlV4OPBh0KBIOZA+OzD5cvr87wFV+V0/IKdynZZRVaZSqHkbe2xGGWacaG/fgT8
 FJ+Utz4aNC9oJZ+Q3I7+xu8kXGfSBIg9tLbT4AN8qkg616ujojznIRqTtf3qsOsq/2yp
 ZdvQ==
X-Gm-Message-State: AFqh2kq9y/mcLtkYK/h3YMIove5xQvEIcx9OxQK+n1aNYDepL8rZ8RoU
 QQAwTz99qaOo3wHl/yywgbzQdW9p8/XiaONY3YY=
X-Google-Smtp-Source: AMrXdXszs936Aen2iVxbTZicW+URQ0NA/MB8n3GzYazmfaKRuIuaeFHHzSQQ2Nv4KSW+c6Y9PLMSc+7rW3sSiNiY+ik=
X-Received: by 2002:a05:6402:548b:b0:499:e52a:8bf1 with SMTP id
 fg11-20020a056402548b00b00499e52a8bf1mr827943edb.207.1673507497914; Wed, 11
 Jan 2023 23:11:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:640c:25c6:b0:1a0:6962:d9d1 with HTTP; Wed, 11 Jan 2023
 23:11:37 -0800 (PST)
From: Franklin musa <musajohnson397@gmail.com>
Date: Wed, 11 Jan 2023 23:11:37 -0800
Message-ID: <CADHNiEdA_E8jMQPr5a4g19M7V_C1JVGwqBj_3C7SmmsOUDhGtQ@mail.gmail.com>
Subject: Greetings
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
Reply-To: franklinmusa58@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

-- 
Dear Friend,

 I am Mr, Franklin Musa from West Africa am sorry to intrude into your
 privacy I got your email address through Internet via computerized search
 after my prayers so I bring to you this transaction which I notify from our
bank an abandon fund which belongs to our late foreign customer who
 deposited the sum of $10.2 Million USD, but he died at of cancer and ever
 since then no one has applied to claim the fund so I write to you with
 confidence that you can be a help so we can get the fund out of the bank as
 his foreign business partner note that once the fund is been released to
 your wish bank account in your country it will be shared among us in the
ratio of 60%40 if you are interested please kindly forward your details so
 we can move towards it.

 Your full Name.....

Your Bank Name....

Your Telephone Number....

 Your Age And Sex.......

 Your Marital Status......

Your Occupation.........

 Your Country City........

 Thanks
 Mr, Franklin Musa.
