Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B24F4C3837
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 24 Feb 2022 22:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFD310E159;
	Thu, 24 Feb 2022 21:55:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2155A10E159
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Feb 2022 21:55:10 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id b35so2138629ybi.13
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Feb 2022 13:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=wv9+lUDiUamCN2D56q0OJAqCtadhguvOfwApXNhEE00=;
 b=fQ9VyErpjH1Ru2YRO5JMu4gTnRckhXUKJUhCFk6Y8aG47Hd8PwdJy/oPgKNwgHhoxC
 5AhXHqsdJmhaZrZFPIArIbhFbISZPzBwxwb1ptDg+s5zvawMcO3MHfTJMqsCbaJbXa/A
 qgSWTSLdpw7rDo7AtX8srEaA+iIcbUpvNIBzdwp78WGvgWPqN0zdNGoDIv9iiC+XOXLj
 9Fv374QMhIfiAwtdpHfsRGad6+RVBmTnL1dgAUSOwxFSP5FyPAkr1FdvMfosUEv035TL
 zYTc1pYNbfqUFAzg/PeSPjJPhBznE70PVOIXo8H8p/FpMQ5CFUITWh3JLRhT4e9tSNJA
 HqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=wv9+lUDiUamCN2D56q0OJAqCtadhguvOfwApXNhEE00=;
 b=INfUe/ZH7kQuvGivfGSMee/7bCZts9OMAfwO1zUC/XVaTbwIWs7EANTQCn2+cZkPSO
 bbgNHW7XsVO9IZItxAseU8NQxsxCC5yIK/JFees3UCb7NowjyhSp6zjt2Evz18OEJivA
 6v9ZJCXMffeCWYlVRu7BxvAFORMDyC4YrBjE2gAx2ViUeufPtif/w4D0wcC0hdAh+Tq2
 1QHe9VGMpkmar7luevsKyBMgNrEsveoAwKsL0xr+SrCE1NgQsgtCAfyfyMSej2OPhx9w
 Q1n0jYW6FiymvM+2pejMRa1+DmDYzJA2usvUwLPhpf9njWKqs9j0S/w82u8UlCrjMAj3
 xkaQ==
X-Gm-Message-State: AOAM531OJYtzYxZv4IH8BS7tjWSjOL8hm8Y5O6YV7jaR/Wl9EAAegrGY
 +CDi2wKf/HcjGHhhhIqTmeVHOE8VSOaziP0V4M4=
X-Google-Smtp-Source: ABdhPJxtktc3ImDCly16x55UpqgVlzHSFiUCHPWrCNE5Dze05Wt+ErZZdMR6SLAhyrMw5CKhFSvZJ+xLXI2T8qp5AxU=
X-Received: by 2002:a5b:1cc:0:b0:625:2da3:cb6d with SMTP id
 f12-20020a5b01cc000000b006252da3cb6dmr2880172ybp.296.1645739709046; Thu, 24
 Feb 2022 13:55:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7000:7f45:0:0:0:0 with HTTP; Thu, 24 Feb 2022 13:55:07
 -0800 (PST)
From: MR DAVID MORRIS <mrjohnwegener35@gmail.com>
Date: Thu, 24 Feb 2022 13:55:07 -0800
Message-ID: <CA+Kwxe_LzQeA6t3SzVrqsymGbcsgko+Yqh+6hNoTZHx-xKVDpQ@mail.gmail.com>
Subject: Dear Beneficiary
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
Reply-To: mrdavidmorris1718@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

-- 
I am MR DAVID MORRIS, Inspection Unit Manager United Nations,
Inspection Agency in Hartsfield Jackson International Airport Atlanta,
Georgia.During our investigation, I discovered An abandoned shipment through a
Diplomat from United Kingdom which was transferred from JF Kennedy
Airport to our facility here in Atlanta,

The ATM debit card is worth $8million,And I  Ascertain you
that the consignment is in your name,you are advised to provide all
detail for claim.

Sincerely,

MR MORRIS

CONTACT.......... mrdavidmorris1718@gmail.com
