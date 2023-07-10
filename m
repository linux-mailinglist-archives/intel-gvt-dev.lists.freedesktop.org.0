Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E293A74D7DD
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Jul 2023 15:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B926B10E093;
	Mon, 10 Jul 2023 13:36:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2F510E093
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 10 Jul 2023 13:36:42 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-55bac17b442so3474037a12.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 10 Jul 2023 06:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688996202; x=1691588202;
 h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/2RlxWlOhJbOFxHHiWp08TsyEu+zJrfP5HNHS/WQHJU=;
 b=Tsku914r5LP6Mw3PeJZnlI0v0yP0/M4VkZ/fLuECRp/cfEDUwOw2jBr0yneV5D7wM6
 XEOvI5R6Cm8fw8/kBLlRn2hEfzht4PCkjvfoKlsqopl7+NbQL+H1odtr1JymLpO6bogB
 KoH+oisXRnYz8mvJvec109sbqbW8qz6obMjnSXeuc0NXVGPO2i19Hlv646DVsCinqG0Y
 7Yi8EiLb6Vq2uUfGoyY3erJioAm6hTvccTDJYakvhJPfBBmnwvSB6gxQIg5bmJgxxW7p
 ysVeMVWSp3EJf8y6FB+RtNsrDS1zXHosbkFv7waJsbN4gPGp8EhoMz36DL1/N6Nooytv
 zMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688996202; x=1691588202;
 h=to:subject:message-id:date:from:sender:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/2RlxWlOhJbOFxHHiWp08TsyEu+zJrfP5HNHS/WQHJU=;
 b=LHxie4BK5CXXF78LSoydI+9dj3ElK7OIeponfrkNj9Jgmz1gC0Ohz88W3N5QbHj5p+
 X6CIY5VJYDvnMORZnbcIPmniyWab6/16KNoCa/nzB/KYrYKQmHzHzisZ+Td8zh82z7Nd
 jLrbjn5G+4iW0flCcRYgGRZkXtSKT1rSrpLh2R0Thi147QxGQooDWRaZJoSYmx+mHQkF
 J4QBz0pFLMI9N+n2P36pab80TGcGDZlbrKk2Zt+bB3+hHBTu4lWx/DVc0AL2VDb/h2x2
 REhCR8lpKlc5wQwQYGK1UYGz5Xb08sEow43hwliV2GHU1PE12Dcsdm07JYf7w0FVw0eN
 oE4g==
X-Gm-Message-State: ABy/qLbNobuTjRMEU4yYFrBUhvfchLYUW9O5NMKdOl9edqq378qyZqAw
 A2rQTiIGMNamaNuVUIGsNG+siYRnhdZ1HJUkdYE=
X-Google-Smtp-Source: APBJJlHSY3FUdO59MsnVvsvyNtH23CcHANS8Wrxxg8sFB3UmcbdlmZVB2Yswq2CX4BehNV3oHen4/DP3Ksicqz2RrhQ=
X-Received: by 2002:a17:90b:3a83:b0:262:d6cb:3567 with SMTP id
 om3-20020a17090b3a8300b00262d6cb3567mr13711650pjb.26.1688996201910; Mon, 10
 Jul 2023 06:36:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:4292:b0:68:47b5:acef with HTTP; Mon, 10 Jul 2023
 06:36:41 -0700 (PDT)
From: "Mr. Sal Kavar" <salkavar78@gmail.com>
Date: Mon, 10 Jul 2023 06:36:41 -0700
X-Google-Sender-Auth: rw4LEBn3DaYybU7zC7Xx8Kj5Wk0
Message-ID: <CADtbHf1wW1_qjvYY+6gvzdmFw7u3dj3VcoRu79vkjSQiAsp=uw@mail.gmail.com>
Subject: Yours Faithful,
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
Reply-To: salkavar78@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

I assume you and your family are in good health.

Overdue and unclaimed sum of $15.5m, (Fifteen Million Five Hundred
Thousand Dollars Only) when the account holder suddenly passed on, he
left no beneficiary who would be entitled to the receipt of this fund.

Yours Faithful,
Mr.Sal Kavar.
