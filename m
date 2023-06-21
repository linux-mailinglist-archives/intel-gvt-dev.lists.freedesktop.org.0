Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AA77383DB
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jun 2023 14:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CAB10E45B;
	Wed, 21 Jun 2023 12:32:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E125B10E459
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 21 Jun 2023 12:32:07 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id
 38308e7fff4ca-2b45a71c9caso77577461fa.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 21 Jun 2023 05:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687350725; x=1689942725;
 h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HVtqxsKcaeavfG26ZICgsu6uNhoc6QxzBFISUtYjLxY=;
 b=SurunTBWQCOGr+Lpj3nm8UJQpkvglX9uzTYFfjh4f2He2S5UPe2/y1F4fBFtjv/XT6
 Yf6kLZAGQuCQqY9yiGTZvjWcUQd4jXXUo/HYPAH83hMlwpdN1CwOUDmt8dMB2O9hbTH3
 eJaJLx3QgQDeprKEunuXB0iff6bc3JOH51WuZR7oRDAguKM/ICZ+01QmPXMHUhRxu+LF
 zdsr8y22v6Uz7VthbPwzDzPprrm7OAAYwn+q4uc6MGIFqqdVx9lezFBqfl6tLWVN0HV7
 /Ssr+H9WQ4pTuEWECMhDPdKo9WnDnUj3KXS7l11OG54YP31l94jG4Jn2K/BkhsRe+gWk
 NTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687350725; x=1689942725;
 h=to:subject:message-id:date:from:sender:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HVtqxsKcaeavfG26ZICgsu6uNhoc6QxzBFISUtYjLxY=;
 b=JaqMY47OqIZn7VG0idiAEcNtodYGJxPGeN1gG5oYi6n7XwgjZ8mhlj1NOOWd+nKH5h
 2DDfaR/ai2ov+ZFuz2ZnPd7OfR8/nFg5RXedxtxE6CzoRMbtcAtlnH2ki70Yg5/gHaoD
 r/oW7spRYgadJM0okrQlEXhTFFOT6xouE3SF2VcP5RLnfxwg5QoL57r5CCDBKjeLAiVp
 eDJX+YRPDRf2AzR7UtWwRA0sQJASHLwWZE8KUgJlDDtpeunhBwKJ/asUSheBgii93X2G
 RgO2EdSwCbImw4K8gz24HDSr2cIGAjud7FpYcxGR7bEO4B9DTPXHXVXmdgIbETEWqukb
 +CDA==
X-Gm-Message-State: AC+VfDwocp3gLcSry24ju1zMLXNbRbka6o3R1Dm/Bb4kodzzqkIOrVJ+
 BVGhFp+osixD24jZA/wq7AZ11c00HPjUsTUxo2A=
X-Google-Smtp-Source: ACHHUZ6kUq1NPDzoD7FlNqjbxaCQiVyjC1K2na0QrwCu427eFjMsO0X+ig2c1CJU9iGtYkQdHDza9GK2I98JS2L0ty4=
X-Received: by 2002:a2e:a0d5:0:b0:2b4:5cad:f246 with SMTP id
 f21-20020a2ea0d5000000b002b45cadf246mr9082039ljm.7.1687350725125; Wed, 21 Jun
 2023 05:32:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9402:0:b0:2a8:d38d:f29b with HTTP; Wed, 21 Jun 2023
 05:32:04 -0700 (PDT)
From: INTERNATIONAL MONETARY-UNIT <internationalmonetaryunit14@gmail.com>
Date: Wed, 21 Jun 2023 05:32:04 -0700
X-Google-Sender-Auth: d5hfu7VABsVuyAZCfxd19hSYVho
Message-ID: <CALtGhaNbxx=knqrn39wt3Aeph16t39N9Fr0Haz7v4upJrJ3bag@mail.gmail.com>
Subject: UNITED NATIONS COMPENSATION PAYMENT OF $2,500,000.00
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
Reply-To: internationalmonetaryunit14@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

IRREVOCABLE COMPENSATION PAYMENT OF $2,500,000.00 VIA ATM VISA CARD
or online banking transfer.

We have actually been authorized by the newly appointed Minister of
finance and the governing body of the United Nations Monetary Unit to
investigate the unnecessary delay of your payment. During the course
of our investigation, we discovered with dismay that your payment has
been unnecessarily delayed by corrupt officials of the Bank in attempt
to swindle your fund which has led to so many losses from your end and
unnecessary delay in the receipt of your payment.

The United Nations and the International Monetary Fund (IMF) has
chosen to pay out all the unpaid contract, inheritance and lotto
winning claims by Companies and individuals to 50 Beneficiaries from
U.S.A, Europe, Canada, United Arab Emirates, Bahrain, Qatar, Saudi
Arabia, South America, Australia and Asia and Africa Continent through
online banking transfer or ATM Visa Card as this is a global payments
technology that enables consumers, businesses, financial institutions
and governments to use digital currency instead of Cash and Cheques.

They will appear at International Criminal Court (ICC).This notice is
been directed to you because your email address was found in one of
the scam Artists file and computer hard-disk while the investigation,
Maybe you have been scammed; you are therefore being compensated with
a sum of $2,500,000.00 valid into an (ATM Card).

Even if you are Now-dealing with these nonofficial directors of the
bank or any department always requesting Money from you, you should
STOP your communication with them and forward the details,

We have arranged your payment to be paid to you through ATM Visa Card
or online transfer in the support of (SGBBF) United Bank for Canada
(UBA) Bank Canada. And this will be issued on your Name and
shall be posted directly to your address via DHL or any courier
services available in your country. Upon your contact with us, the sum
of $$2,500,000.00 will be credited into an online banking or an ATM
Visa Card and this will enable you to withdraw your funds in any ATM
Machines in your country with a minimum withdrawal of $5000.00 per
day. Your limit can be increase to any amount upon your request.

In this regards, you are to contact and furnish the requested
information to the Directorate of International Payment and Transfer
with the followings.

1. Your Name:
2. Country :
3. Age and Sex:
4. Occupation :
5. Mobile Telephone:
6. Delivery Address:
7. Id Card Identification:

We required your urgent response to this email as directed to avoid
further delay.

Yours faithfully
INTERNATIONAL MONETARY-UNIT.
