Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3424B7FA4D6
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Nov 2023 16:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADD810E04C;
	Mon, 27 Nov 2023 15:36:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDB710E2E0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 Nov 2023 15:36:15 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c8872277fcso44442311fa.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 Nov 2023 07:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701099373; x=1701704173; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBy7GgOJiogOwvcFmLqia6UfOspV6dm6M/Sk87LaocY=;
 b=U7RflYDub0JHeMML6Bv+4euyiE/3j+D5dMxzpgSDKGU1+HbGlEy6jdm7rb0DTy1Q5I
 wNDdKPne45y9VnN4bSBxEdSN2IUtY+CiTuT840UZWFcAH5vA7XQppC+HyXdbLNuWsyDD
 Pl08XHJ6U8Ppwyj4IXwSfwdeZeLotrIqqlQZbTHlLnlagEThnH8fVbgZ5/6dIuoyha+C
 Box8B5TLYYRlc2r9oeA1cTK0g576B6Cgcos7jI84dTvkpHwxO9Cyy6Gif+5Kh6VNQKHp
 IcgjOxfUf95Q5/zvJFdfGXMbKs5FYXuf7qPr888D7mjzSOLJp5OW0pvFhlgYubU30WuO
 VeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701099373; x=1701704173;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PBy7GgOJiogOwvcFmLqia6UfOspV6dm6M/Sk87LaocY=;
 b=YvkCMzM20TWfpDLIpf/Z+6rD2r0ae9FRO6KDTilAqqv+jTiFOyl0Ly+URWmWVGDaha
 0eirx3STb66m3CaALgPQhGa1GUgh2IBrfCdyr7+kCfUL1XOKiswDUbUnXpuRtIie/eML
 FvUJZq31qM+dBSWJGXv89oIcXdZTF03RHasq++RiGIZj/APsr9qivpBHEOvoc33k2uTZ
 rMMB6a/f0n8dU87TAZUfuu2AeeLF+ksETDqcv+XJ45yXjWWrXq9nP0JkTK53oSrpYQ5O
 fXFGvMVNvJiq5vBzS9qa2+FjoEkpUX58dnPFIulQbhKookOm+pl+D0oMaE8CIESnR4x7
 dfXA==
X-Gm-Message-State: AOJu0Yw3V5veV/zaEsBBh+kZxSKVGRvXGeFd1TDw5rDMCs2eBTY8FKJe
 Bq5UKWPEAFQNIsFyWnISoMZmExnDoPAPNLnjEbM=
X-Google-Smtp-Source: AGHT+IHYX7mH4HfQYwwcV4NMAAZXm1wgoWZ3dYxa1VrSO2QF0gtsrOscQWHFIUa6R8o4p6o27NBpr7OPul4QkZtVsOU=
X-Received: by 2002:a2e:b52d:0:b0:2c6:f1c8:8518 with SMTP id
 z13-20020a2eb52d000000b002c6f1c88518mr4307003ljm.22.1701099372944; Mon, 27
 Nov 2023 07:36:12 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab3:66d4:0:b0:24c:8aa3:ad03 with HTTP; Mon, 27 Nov 2023
 07:36:12 -0800 (PST)
From: MR Merrick Garland <anichikelum@gmail.com>
Date: Mon, 27 Nov 2023 07:36:12 -0800
Message-ID: <CAGwKJL-Epm-weAyg9BFxNzGU6LqQQFG-4eoiBfCoonbv=RgVeg@mail.gmail.com>
Subject: Attention Dear Customer,
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
Reply-To: officeoffice1025@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Chase bank of united states.
201 north walnut street Wilmington, DC 19801

Attention dear beneficiary

This is to notify you that your fund USD $ 8.5 Million has been programmed in
an ATM visa card for immediate delivery to you upon reconfirming your
physical destination address as all arrangements has been finalized
and to released to you as the legitimate beneficiary of the fund, via
global ATM visa card.

Your ATM visa card worth USD $8.5 Million united state dollars was with a
delivery service here in chase, bank we have waited enough to hear from you
so that your funds can be transferred through chase Bank here, but due
to the late response we decided to credit the fund through ATM card.

Requirements:

1. Full Name__________________________
2. Name of Country/State/City______________________
3. Delivery address________________________
4. Occupation____________________
5Sex________________________
6. Age________________________
7. Personal telephone number______________________
8. A copy of your passport/driver's license____________________

PIN number is (0516) take note, once you get to cash point around your
area and slot the card and enter the PIN number (0516) your card will
be then activated you start to withdraw over there.

Finally, be informed that we have left delivery company for urgent
delivery of your ATM visa card immediately you forward them the
required information, feel free to get in touch with them today.

reconfirm your full information
to receiving  your ATM visa card.

kindly contact this email address officeoffice1025@gmail.com about you ATM CARD

i am  MR Merrick Garland the chase bank manager contact us with you full
information so that your can receive your ATM card at you apartment
successful
