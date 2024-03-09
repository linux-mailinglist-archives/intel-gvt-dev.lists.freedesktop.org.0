Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5546C877279
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  9 Mar 2024 18:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE57112258;
	Sat,  9 Mar 2024 17:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hikari-net.co.jp header.i=@hikari-net.co.jp header.b="ZPyq8fKh";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 16471 seconds by postgrey-1.36 at gabe;
 Sat, 09 Mar 2024 17:37:51 UTC
Received: from mwp-bld-mts-004c1.ocn.ad.jp (mwp-bld-mts-004c1.ocn.ad.jp
 [210.154.211.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CEB112258;
 Sat,  9 Mar 2024 17:37:51 +0000 (UTC)
Received: from cmn-spm-mts-001c1.ocn.ad.jp (cmn-spm-mts-001c1.ocn.ad.jp
 [153.153.67.130])
 by mwp-bld-mts-004c1.ocn.ad.jp (Postfix) with ESMTP id 3124C2F5E4E;
 Sat,  9 Mar 2024 22:03:19 +0900 (JST)
Received: from oa-arf-ucb051.ocn.ad.jp ([153.149.142.197])
 by cmn-spm-mts-001c1.ocn.ad.jp with ESMTP
 id iwMBrsmv2DXd9iwMBr7YV9; Sat, 09 Mar 2024 22:03:19 +0900
X-BIZ-RELAY: yes
Received: from oa-archive05.ocn.ad.jp (localhost [127.0.0.1])
 by oa-arf-ucb051.ocn.ad.jp (Postfix) with ESMTP id EC6D83E02AF;
 Sat,  9 Mar 2024 22:03:18 +0900 (JST)
Received: from mgw-vc-mts-002c1.ocn.ad.jp ([153.138.213.206]) by m-FILTER with
 ESMTP; Sat, 9 Mar 2024 22:03:18 +0900
Received: from mwp-sdgw-mts-008c1.ocn.ad.jp ([122.28.88.75])
 by mgw-vc-mts-002c1.ocn.ad.jp with ESMTP
 id iwM4rmpv5nYb9iwM4raxIj; Sat, 09 Mar 2024 22:03:12 +0900
Received: from c15pes1g.mwprem.net (c15pes1g.mwprem.net [122.17.164.198])
 by mwp-sdgw-mts-008c1.ocn.ad.jp (Postfix) with SMTP id F06C88000440;
 Sat,  9 Mar 2024 22:03:11 +0900 (JST)
Authentication-Results: c15pes1g.mwprem.net;
 arc=none smtp.client-ip=105.163.1.13
ARC-Seal: i=1; a=rsa-sha256; d=mwprem.net; s=default; t=1709989391; cv=none;
 b=Izxy8n3QQGs/0ZVdfQP1oirU1aUdH4/HwWx/GXbdzQLZK3smXoYEQXDqcb2eqj2uBEpQzsQzS1obFNnhNsnW94hFo9s4FgbFCU5cdV/CEDQZrGDvTQaKXsOISms7Yfvmvx1V6y4Opuhp/+83z6tuSRSG9SVVS7OT4DCAw/8LvOM=
ARC-Message-Signature: i=1; a=rsa-sha256; d=mwprem.net; s=default;
 t=1709989391; c=relaxed/relaxed;
 bh=F/dF+vnQhssMaNRNkzkSQ4+a1B08I6ehSpLZkwqqR4I=;
 h=DKIM-Signature:MIME-Version:Subject:To:From:Date:Message-Id;
 b=oOgdTGepEvYyk1TjG95JyVrhxBZluePNFXICFPo9QwYkP8ZLCw14X/IMZlbT6z6vN4GLEAqsI5QaeLGwmPdoRpZnPHA1M/1YLDpueOv0IUTfDJvW1gZIidf+sA3oADfU+3rl/PgbgN4B+7QIv8CGFpNJQjX/RsdsWUKP3O6USVM=
ARC-Authentication-Results: i=1; c15pes1g.mwprem.net;
 arc=none smtp.client-ip=105.163.1.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hikari-net.co.jp;
 s=bizmw; t=1709989391;
 bh=F/dF+vnQhssMaNRNkzkSQ4+a1B08I6ehSpLZkwqqR4I=;
 h=Subject:To:From:Date:Reply-To:From;
 b=ZPyq8fKh/VYDnuYtmMvts3XsfqxPMuqTyaqF0eyX+BES4YHKy5y63SMjlRePYvXpU
 9cdAtuIRvCYBHlD6QN+Ne3zi22l0wObKfu6/GZVgaVxU4QEymuQxMSn+orDldsxnVH
 ANNEL2V3I1U++7ZlJb16MAXVgorNfCV53nl5n70A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?q?RE=3AEtes-vous_toujours_int=C3=A9ress=C3=A9_par_cette_subventio?=
 =?utf-8?b?biA/?=
To: Recipients <skamei@hikari-net.co.jp>
From: Mr Tom Huddleston< skamei@hikari-net.co.jp>
Date: Sat, 09 Mar 2024 05:02:53 -0800
Message-Id: <20240309130305.03097C15FE89@c15pes1g.mwprem.net>
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
Reply-To: tomhuddlestonjr4@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Cher ami,


J'esp=C3=A8re que tu vas bien! Je vous =C3=A9cris pour conna=C3=AEtre le do=
n de 800 000,00 =E2=82=AC qui vous a =C3=A9t=C3=A9 accord=C3=A9. S=E2=80=99=
il y a des changements ou si vous avez envisag=C3=A9 une r=C3=A9vision du f=
inancement, veuillez m=E2=80=99en informer imm=C3=A9diatement. par email di=
rectement

 (tomhuddlestonjr1@gmail.com)

Et si cette subvention n=E2=80=99est plus n=C3=A9cessaire, n=E2=80=99h=C3=
=A9sitez pas =C3=A0 nous le faire savoir afin qu=E2=80=99elle puisse =C3=AA=
tre transmise =C3=A0 quelqu=E2=80=99un d=E2=80=99autre.

Si vous avez besoin d'aide ou d'informations suppl=C3=A9mentaires, n'h=C3=
=A9sitez pas =C3=A0 me contacter.

Cordialement

Tom Huddleston Jr.

