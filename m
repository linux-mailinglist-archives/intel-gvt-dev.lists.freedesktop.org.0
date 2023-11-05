Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F9C7E1704
	for <lists+intel-gvt-dev@lfdr.de>; Sun,  5 Nov 2023 22:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014FC10E242;
	Sun,  5 Nov 2023 21:59:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 5146 seconds by postgrey-1.36 at gabe;
 Sun, 05 Nov 2023 21:59:30 UTC
Received: from SMTP-HCRC-200.brggroup.vn (unknown [42.112.212.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2880010E242
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun,  5 Nov 2023 21:59:29 +0000 (UTC)
Received: from SMTP-HCRC-200.brggroup.vn (localhost [127.0.0.1])
 by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTP id 265A9192F2;
 Mon,  6 Nov 2023 01:58:05 +0700 (+07)
Received: from zimbra.hcrc.vn (unknown [192.168.200.66])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTPS id 1F9A61956F;
 Mon,  6 Nov 2023 01:58:05 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.hcrc.vn (Postfix) with ESMTP id B15B21B8203A;
 Mon,  6 Nov 2023 01:58:06 +0700 (+07)
Received: from zimbra.hcrc.vn ([127.0.0.1])
 by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8mcOcAErjmPA; Mon,  6 Nov 2023 01:58:06 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.hcrc.vn (Postfix) with ESMTP id 809531B824EE;
 Mon,  6 Nov 2023 01:58:06 +0700 (+07)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.hcrc.vn 809531B824EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hcrc.vn;
 s=64D43D38-C7D6-11ED-8EFE-0027945F1BFA; t=1699210686;
 bh=WOZURJ77pkiMUL2pPLC14ifVPRvyTQIBEQmxuN1ezAA=;
 h=MIME-Version:To:From:Date:Message-Id;
 b=JEImj1vLRnKy+22FMhEr6i/KqvxpwH6N6Hd78AdgT1uAU+G9qocwn0MPNq8G1GXRR
 YAnX7PDRIIoKoinbDkLIvpii9jtMt+zetMugzgWbNOaM9JrRyLg6Cvdhey7ke2dLQu
 rfopdnL9PBxCMNlrl/5pzPhBFQ6H22H+7fAl1/Mist0eqfDZntaj8teTbrzCUN/Rek
 LTOKW+NeES81waTb0xgsE3Qyd46PWwdRbPHQsraLKSYT9SrHsBGdIvhx8hx9sBaoPB
 jLZXSgis0EEy7h+BIXrdOyaGI7w7Eizresq9YMc5GaDZQJEnWRKCa1RPQV8gzlteGZ
 qEtoFXg/wv6gw==
X-Virus-Scanned: amavisd-new at hcrc.vn
Received: from zimbra.hcrc.vn ([127.0.0.1])
 by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wnmZ1-OtIRVg; Mon,  6 Nov 2023 01:58:06 +0700 (+07)
Received: from [192.168.1.152] (unknown [51.179.100.52])
 by zimbra.hcrc.vn (Postfix) with ESMTPSA id 1DF2B1B8254A;
 Mon,  6 Nov 2023 01:57:59 +0700 (+07)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?b?4oKsIDEwMC4wMDAuMDAwPw==?=
To: Recipients <ch.31hamnghi@hcrc.vn>
From: ch.31hamnghi@hcrc.vn
Date: Sun, 05 Nov 2023 19:57:45 +0100
Message-Id: <20231105185800.1DF2B1B8254A@zimbra.hcrc.vn>
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
Reply-To: joliushk@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Goededag,
Ik ben mevrouw Joanna Liu en een medewerker van Citi Bank Hong Kong.
Kan ik =E2=82=AC 100.000.000 aan u overmaken? Kan ik je vertrouwen


Ik wacht op jullie reacties
Met vriendelijke groeten
mevrouw Joanna Liu

