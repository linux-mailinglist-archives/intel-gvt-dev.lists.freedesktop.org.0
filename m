Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 861ED5827CE
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 27 Jul 2022 15:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC3911AD8A;
	Wed, 27 Jul 2022 13:37:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA3910F9E8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Jul 2022 13:37:13 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id u76so20842887oie.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Jul 2022 06:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ObIdrx/2+rwrr3Spu0DNQxwWs/W3U8LHCozkhGpRsnM=;
 b=qVT9GmE7NLTd2psKgB0XnVWsQJX+kbmhg3wvO7+/xhFJqZ/DaNR1wog5h2E5q+r07c
 IvnisCiPoXcahNtTXYiBK7ORQnEVLk2Lko7ZIn+SF5uIM6tsPKUMiYWomZ/chvvuhurM
 C/DvH1Myx0hcUjQpXZigwQeGRb9Gl/h3Gao6PyxzkJHKvKnSjjE3ud8r7RvP6cPj5R6A
 QYWnfYWG2YtG7FTIW1E8ARErxOgi9EgqRC0B6ypF9uYMbe43WpwmqU81doDop3yv0/uF
 frzRMz9cNFMklxEXO7ZI9uIA0V+GiEzmDM29PoJmKkY51YE9oMOWXM3WHwpgHDj5xCt5
 nzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to:content-transfer-encoding;
 bh=ObIdrx/2+rwrr3Spu0DNQxwWs/W3U8LHCozkhGpRsnM=;
 b=jJhoK3vHntqYjhCwueFaOR8n4ZSgU9cfQ8RC+L2lbF7SJqqIjuxIWIKsxq6fNTEA/7
 1UMKjS/kExzLMmzCNTE83lrBZnXJzGoFr/Em61xOwG9O8P7RQBgWiyhmqBf6wxJWTwob
 0kyeT8TKwTzF7p7yHC3hI93jXQdJ17cXZ32qyfjypU8h6r358+ceuXMPEXcZa4lzQOtg
 5PRnSiJNY49OZE/TVgrWcg2wtLfK9btOBEos78dDg/TKGrgt6+bhteWfpuTpYgg6eABo
 e3kY18OJiSls63AKHdzNM5fdoU4gCzClrOATgv57tfxd+PtNyms1lA3zfYITSrCRPuCQ
 wn3w==
X-Gm-Message-State: AJIora9YMU4oTG+TVtNpi8AyuX3FV0uqhVVC7bsfQO+q2j0ZSdrMSwkI
 rtyFPlPaoUfi4itFGj4KuNWajE8dhGitLLBq8Ew=
X-Google-Smtp-Source: AGRyM1sfnCOim7sOchy9PK1NJ3e/Grb6G2ppsSkULeCk9bAGm5SznREIkx5TQ8QrB+4v7Jx1W0+FIHoNKeLQhWE7EJY=
X-Received: by 2002:a05:6808:143:b0:33a:d513:1443 with SMTP id
 h3-20020a056808014300b0033ad5131443mr1835083oie.43.1658929032393; Wed, 27 Jul
 2022 06:37:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:d94:0:0:0:0:0 with HTTP;
 Wed, 27 Jul 2022 06:37:11 -0700 (PDT)
From: Attorney Amadou <kodzoagbolan12@gmail.com>
Date: Wed, 27 Jul 2022 06:37:12 -0700
Message-ID: <CAHtEYbk1W3HCvJCHTAAuGHVcPoN0eTyQ9j84gPs1ZAN=5_M9iw@mail.gmail.com>
Subject: 
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
Reply-To: barristerbenjamin221@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hello good day.

I am Barrister Amadou Benjamin by name, With due respect dear friend,
I am contacting you to help get the deposit of 10.5 million Dollars, my
late client left in his Bank before his sudden death on April 21,
2007, to avoid confiscation by Lloyds bank. Please write me back
through this email (barristerbenjamin221@gmail.com) for more
information about this transaction or send me your private email to
contact you myself.

Sincerely.
Barrister Amadou Benjamin Esq.
...........................................................................=
...................
Hallo guten Tag.

Ich bin mit Namen Barrister Amadou Benjamin. Mit geb=C3=BChrendem Respekt,
lieber Freund,
Ich kontaktiere Sie, um Ihnen zu helfen, die Anzahlung von 10,5
Millionen Dollar zu erhalten, meine
Der verstorbene Kunde verlie=C3=9F seine Bank vor seinem pl=C3=B6tzlichen T=
od am
21. April.
2007, um der Beschlagnahme durch die Lloyds Bank zu entgehen. Bitte
schreib mir zur=C3=BCck
=C3=BCber diese E-Mail (barristerbenjamin221@gmail.com) f=C3=BCr mehr
Informationen zu dieser Transaktion oder senden Sie mir Ihre private E-Mail=
 an
kontaktiere dich selbst.

Aufrichtig.
Rechtsanwalt Amadou Benjamin Esq.
