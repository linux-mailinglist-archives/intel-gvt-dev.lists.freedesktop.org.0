Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C494724122
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  6 Jun 2023 13:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFE310E330;
	Tue,  6 Jun 2023 11:38:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9275410E330
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  6 Jun 2023 11:38:21 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id
 d9443c01a7336-1b025d26f4fso52584835ad.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 06 Jun 2023 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686051500; x=1688643500;
 h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
 :to:cc:subject:date:message-id:reply-to;
 bh=egwO5+jRcHqhSVFUfUGWVJVk/4clvS0mJ+iA2ckPsK0=;
 b=OVskoZPVUIN8AfMQu+BPCnn/ul+FsE8pR+kRH4EJCpPqYliMyvpQ3WDbMO0wLr5va1
 jPMiRL/m8AZHqskYCs5NR9aR2uMicxhapPCIYCHYoF/ArxfzWAFm0tyWxiiyQkTEUjhL
 G1OZzEnjX7MD62Wl5YnBsIpxqhWw3xm46i3Og2YMJOCqzlM/IsHQ8FryHz6QZxM+O07n
 2oetjgffhiG9H61dHlC5ColIsyXeB3XS9UbHZ5u6UTPNu63xt0G0a3t0vtjelgf5SDYj
 3wsbYCkp12qjrwDF7MYSqHVRp6p1n9jrTUuVRUsuYg+jg07MdlDWjcBjnIVzbT2y1owO
 sUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686051500; x=1688643500;
 h=to:subject:message-id:date:from:sender:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=egwO5+jRcHqhSVFUfUGWVJVk/4clvS0mJ+iA2ckPsK0=;
 b=cPy7oWtoNDiGBkEAXoS0TOJgNXyL9lDjRxalKInZ17gaHVHtZEX4Ex6En9s2ZHh4tu
 C6aF38kudrizTkcAaznHh1XUrCxcq6p47yU8we3YdaWl1R/1cJ3URTs2u1AZ0xX/bhOs
 jlIu0siOs+5hKLNEEYvX3bozaS23HFhfhsFMWJfcaDiZuzpx77c4MzeIE8EndajNmswu
 ubYhzWjBqgYQX6Ni3ES/g4EBpvew6OnL1MJUgtHUU+qYsM2e28NpQ5qUgh5ZPzScnC/N
 vmQAMm+GTcGad/NN+D/Dxn47Be4lpM1Wv5JFGMRJx9FcdRmVmcDOmLwNHwSsU9oo3Bbd
 H8oQ==
X-Gm-Message-State: AC+VfDzzGn3NqKLE2HT3Y7JxcLyYR7g3FWKoc5DKwtBdlYwL90p3YQer
 +C5md8QcGFCaTtCC1Ij08FP3v6z6ylizIkiU1WA=
X-Google-Smtp-Source: ACHHUZ4eco4FhYkEKsjIVnJItXFkC6ZRusHWMU1MGJh1kohdz3zB3h7juzR//FU1oI03Cd2PIfIvbkG/LfUlKnNAgtk=
X-Received: by 2002:a05:6a20:12c2:b0:111:366:eea2 with SMTP id
 v2-20020a056a2012c200b001110366eea2mr2576289pzg.27.1686051499820; Tue, 06 Jun
 2023 04:38:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:6c07:b0:ce:89d6:e8d4 with HTTP; Tue, 6 Jun 2023
 04:38:18 -0700 (PDT)
From: Abebe Aemro Selassie <abebeaemro99@gmail.com>
Date: Tue, 6 Jun 2023 04:38:18 -0700
X-Google-Sender-Auth: 1xWuspLo2Gm7uhOwK-SDT-kKsDk
Message-ID: <CAB=VgLbUwgV=cRAptzcYyHmQRsGhjWNwsYGTUOAGDvxAnUtBzQ@mail.gmail.com>
Subject: Greetings From Mr. Abebe Aemro Selassie
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
Reply-To: abebeaemro99@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Greetings From Mr. Abebe Aemro Selassie

I have a Mutual/Beneficial Business Project that would be beneficial
to you. I only have two questions to ask of you, if you are
interested.

The reason why I contacted you is because am the account officer of
Mr.Jin Wei-Liang,here in our bank,who died in covid19 pandemic with
his family,since that time until now,no one has come for the money,the
meeting we hosted last week with the central bank president,bank
management agreed to take the money as government property,that is the
reason why I contacted you so that you can apply to our bank as a
cousin to Mr.Jin Wei-Liang,because I have all the documents concerning
the disease customer in my office,I will be here as asider and be
giving you informations,anything bank asked from you,I will give it to
you because in this life opportunity comes but once,I have been
working for this bank for good 13 years now and am based on monthly
salary and never achieved a tangible thing and if I don't do the
business with you,bank will still take the money so this is the reason
why I contacted you so that we can do the business together,the
disease money is (18.6 million dollars),50 percent for you,50 percent
for me,if you are interested respond my email but if you are not
interested do well to inform me so that I will look for another
partner and please don't expose me,delete my message because if bank
finds out,I will be in big trouble..These are the two questions I
would like you to answer:

1. Can you handle this project?
2. Can I give you this trust?

Please note that the deal requires high level of maturity, honesty and
secrecy. This will involve moving some money from my office, on trust
to your hands or bank account. Also note that i will do everything to
make sure that the money is moved as a purely legitimate fund, so you
will not be exposed to any risk.

I request for your full co-operation. I will give you details and
procedure when I receive your reply, to commence this transaction, I
require you to immediately indicate your interest by a return reply. I
will be waiting for your response in a timely manner.

Best Regard,
Mr. Abebe Aemro Selassie
