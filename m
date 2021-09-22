Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0247D4150F0
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 22 Sep 2021 22:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5C26E049;
	Wed, 22 Sep 2021 20:04:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE026E049
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 22 Sep 2021 20:04:31 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id l19so4226877vst.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 22 Sep 2021 13:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=HyojCuqfsBOAZqq1B3Z8c4xkKvvHwFaZYWxD/njvKF0=;
 b=kSp2EWnLyHI1QZrivQXiPiYXnToYsXjg9i7drcb5YYfZVGctAmCHKSUwIyGEZgSurK
 mYreXbzPGT3ejECtvJBUhVdRg4UNgdAAyl9NWmQNUHENGLIQhZQMynjP9M7txrHnq4aQ
 jbvr7lK1wFPsv+k6jyiKB9iK6PLjv+ez/fLqABYZHNweF+d7M7898jCQlExV2vFmmjjL
 lmw3g5ZojSTXr/suoX2dUMgrzdiysV6i07y110NXW/i+gZ6SkgVgAtn+A5J9Oua487S+
 PBZkBQRVPTFIB3J0XpmAWR++pw4V10DCSIGqwN2chge4OiVf5rw6T6ZKkN6gu8ES5Gbn
 84vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to:content-transfer-encoding;
 bh=HyojCuqfsBOAZqq1B3Z8c4xkKvvHwFaZYWxD/njvKF0=;
 b=2yksweQrmPvbV3NLvhg3kO2c3e3X+yRcwNRWvVpb90MUib2q/Egyg7IyRC9iH0eQvx
 kuUr9Xxiv/TNoTd6f7P5b6y0seGHC57dqp6/TbFzaXTocWzgBJNv7FWRAEGWD+eQmRWH
 rFswlVtq/0mRqzGzBSKefB6UYj5CYgY8QcaTSRg4VUm7Pha7RBhKZQDVSJwpS1yiPQM9
 J3DQExLw3Qe5JjyAbqT0r06v5U5iZRn4C1u0GXg2+L9IMNMNWDv/Ku4qv6A13E9BP4OU
 y1nHRpkgEFs7UWJ1m7Nndw4sAizp4TDKp+bbzT5tlZGk8I8LvV/1GC+JgmAGwpF42uk9
 oRbQ==
X-Gm-Message-State: AOAM5311IC8cjuhhGc1L7aMzdB9dIxVrGv7qnTCs1ws4o6H8w+rR/5cG
 5Wq1TGxaikzUBB2zOspmNTc7pkNqPWZtaTZBvV4=
X-Google-Smtp-Source: ABdhPJzbpDiBDpjsgRW840JAosyCKrpI/PyCeaZRllJRjShFdLG1g1n30DZYxF4Uqu+C+Aw7mh579FTlysyxZ9nvkL8=
X-Received: by 2002:a67:b005:: with SMTP id z5mr1149679vse.13.1632341070877;
 Wed, 22 Sep 2021 13:04:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:23c2:0:0:0:0:0 with HTTP; Wed, 22 Sep 2021 13:04:30
 -0700 (PDT)
From: DR JAMES TATUM <kennetha913@gmail.com>
Date: Wed, 22 Sep 2021 13:04:30 -0700
Message-ID: <CAE7JR-xWgSpi_0N8wTbuUBFURBoCV6SKuEVcfJHM-KZ4rAMFxw@mail.gmail.com>
Subject: Urgent Reply
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
Reply-To: jamestatum4444@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Attention Please


I am DR JAMES TATUM a Manager with the CUMBERLAND NATIONAL BANK  I
have an urgent and confidential business proposal for you. I got your
information in my search for reliable partners who can assist me
actualize this arrangement.

PROPOSAL:

On June 6, 1999, an American oil merchant and Contractor ALBERT SEN
DALY made a numbered time Fixed) Deposit for twelve(12)calendar
months, valued at US$28,000,000.00 (Twenty-Eight Million United states
Dollars) in my branch.

Upon maturity, I sent a routine notification to his forwarding address
but got no reply. After a month, we sent a reminder and finally we
discovered from his contract employers, that he died in Swissair Plane
crash on Monday the 7th of September 2009 GMT 14:22 UK while they were
flying from New York to Geneva.

On further investigation, I found out that he died without making a
WILL and all attempts to trace his NEXT OF KIN were fruitless. I
therefore made further investigation and discovered that ALBERT SEN
DALY  did not declare any KIN OR RELATIONS IN ALL HIS OFFICIAL
DOCUMENTS, INCLUDING HER BANK DEPOSIT PAPER WORK IN MY BANK.

This sum of US$28,000,000.00 is still sitting in my Bank and the
interest is being rolled over with the principal sum at the end of
each year. NO PERSON WILL EVER COME FORWARD TO CLAIM IT.  According to
OUR FINANCIAL LAW, at the expiration of 25 (TWENTY FIVE) YEARS, the
money will revert to the ownership of the GOVERNMENT OF THIS COUNTRY
IF NOBODY APPLIES TO CLAIM THE FUND.

Consequently, my proposal is that I WANT YOU TO STAND IN AS THE NEXT
OF KIN/BENEFICIARY OF THIS FUND DEPOSIT SO THAT THE FUND CAN BE
RELEASED TO YOU FOR OUR MUTUAL BENEFIT. If you will assist me, send
down the following information=E2=80=99s. I will require them for operation=
.

1: YOUR FULL NAMES AND ADDRESS

2: YOUR PRIVATE PHONE AND FAX NUMBERS

3: YOUR AGE.

5: YOUR OCCUPATION.

FOR YOUR ASSISTANCE, YOU WILL BE ADEQUATELY COMPENSATED WITH ( 40%) OF
THE TOTAL SUM. (55%) WILL BE MY OWN SHARE WHILE (5%) WILL BE SET ASIDE
TO COVER ALL INCIDENTAL EXPENSES MADE BOTH AT HOME AND ABROAD BEFORE
CONCLUSION OF THIS DEAL.

THIS TRANSACTION IS 100% RISK FREE as all the paper works that will be
required to effect this fund transfer will be obtained from the
Federal ministry / high court of justice by an Attorney hear in
Nigeria, and my position as the Branch Manager guarantees the
successful execution of this arrangement.

More so, ALL ASPECTS OF THIS TRANSACTION ( FROM THE FIRST TO THE LAST
), WILL BE CONDUCTED LEGALLY in such a manner that it will not
constitute a breach of the law either in your country or in mine.

IF YOU ARE INTERESTED IN ASSISTING ME IN THIS TRANSACTION, PLEASE
REPLY IMMEDIATELY FOR DETAILS. This has to do with fund transfer and
consequently requires speed.

Upon your response, I SHALL PROVIDE YOU WITH DETAILS ON HOW WE CAN
SUCCESSFULLY ACTUALIZE THIS DEAL, I SHALL ALSO PROVIDE YOU WITH
DOCUMENTS IN RELATION TO THIS FUND DEPOSIT THAT WILL HELP YOU
UNDERSTAND THIS TRANSACTION BETTER.

Please realize that the confidentiality of this arrangement must be
maintained from now, and even after the successful completion of this
deal. I WILL MEET WITH YOU IN YOUR COUNTRY FOR DISBURSEMENT AFTER THE
FUND HAVE BEEN RELEASED TO YOU, AND ALSO DISCUSS INVESTMENT POTENTIALS
AS I WILL LIKE TO INVEST IN YOUR COUNTRY WITH YOUR ASSISTANCE.

Awaiting your urgent reply through this email address :()

Thanks and God bless.



Best regards,

DR JAMES TATUM
