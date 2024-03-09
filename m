Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081BB877773
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 10 Mar 2024 16:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7772210E05C;
	Sun, 10 Mar 2024 15:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hikari-net.co.jp header.i=@hikari-net.co.jp header.b="gAIr98U8";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mwp-bld-mts-006c1.ocn.ad.jp (mwp-bld-mts-006c1.ocn.ad.jp
 [210.154.211.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AB710E05C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 10 Mar 2024 15:19:11 +0000 (UTC)
Received: from cmn-spm-mts-002c1.ocn.ad.jp (cmn-spm-mts-002c1.ocn.ad.jp
 [153.153.67.133])
 by mwp-bld-mts-006c1.ocn.ad.jp (Postfix) with ESMTP id A013529A071
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  9 Mar 2024 22:02:15 +0900 (JST)
Received: from oa-arf-ucb052.ocn.ad.jp ([153.149.142.198])
 by cmn-spm-mts-002c1.ocn.ad.jp with ESMTP
 id iwL9rcffnCdj6iwL9rI3fP; Sat, 09 Mar 2024 22:02:15 +0900
X-BIZ-RELAY: yes
Received: from oa-archive05.ocn.ad.jp (localhost [127.0.0.1])
 by oa-arf-ucb052.ocn.ad.jp (Postfix) with ESMTP id 2A03C16202B2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  9 Mar 2024 22:02:15 +0900 (JST)
Received: from mgw-vc-mts-001c1.ocn.ad.jp ([153.138.213.203]) by m-FILTER with
 ESMTP; Sat, 9 Mar 2024 22:02:15 +0900
Received: from mwp-sdgw-mts-007c1.ocn.ad.jp ([122.28.88.74])
 by mgw-vc-mts-001c1.ocn.ad.jp with ESMTP
 id iwL0rwQQOH4FziwL0rRTuH; Sat, 09 Mar 2024 22:02:06 +0900
Received: from c15pes1g.mwprem.net (c15pes1g.mwprem.net [122.17.164.198])
 by mwp-sdgw-mts-007c1.ocn.ad.jp (Postfix) with SMTP id C831D8000440;
 Sat,  9 Mar 2024 22:02:05 +0900 (JST)
Authentication-Results: c15pes1g.mwprem.net;
 arc=none smtp.client-ip=105.163.1.13
ARC-Seal: i=1; a=rsa-sha256; d=mwprem.net; s=default; t=1709989323; cv=none;
 b=d5YPmKA628MkAf2343FRIlF14bpd6xcvP7zFXHSs5aqT+rGDUxTNFoImmNGbkXkyEIicpB6VAgQdgQy9+k+YgJmpsYT1ERU/H2+XcKVkIrps+cavZKWqEZ+RjEI5e+80vCoo1hROBzjVOpzxlQgtKbH8f6E/r32DrRFhuT+lNZI=
ARC-Message-Signature: i=1; a=rsa-sha256; d=mwprem.net; s=default;
 t=1709989323; c=relaxed/relaxed;
 bh=F/dF+vnQhssMaNRNkzkSQ4+a1B08I6ehSpLZkwqqR4I=;
 h=DKIM-Signature:MIME-Version:Subject:To:From:Date:Message-Id;
 b=GzEprQkB+huqlyrH+uZZOD567+Zz8D5MDQjHc5QuLI+83kiD9C5KXECwX66x0hyOdyuCucmPwaIbesKhQF++hSRg9o313zoyITPq83ImMIZFG54fNqKltXQiZNYoZgMk/0vDRxfy6jr+MzUpJkNyczbe/leoVqzb7xORkFDam0Q=
ARC-Authentication-Results: i=1; c15pes1g.mwprem.net;
 arc=none smtp.client-ip=105.163.1.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hikari-net.co.jp;
 s=bizmw; t=1709989323;
 bh=F/dF+vnQhssMaNRNkzkSQ4+a1B08I6ehSpLZkwqqR4I=;
 h=Subject:To:From:Date:Reply-To:From;
 b=gAIr98U8Ng+FGUUwNouyeWAKV6qvxoGej0aJ5b8wlcT4IFencvsYXqEqxbJHwynEa
 yoaiL95SFQastg9JR3xaL3/0VXTlddhLxSV1m6SfCqjFnAWDSJWM+SEMouFnCDbiGF
 8Io2NZurohBLAuc6a6hY2XC0GNlam/3WoOfCvEog=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?q?RE=3AEtes-vous_toujours_int=C3=A9ress=C3=A9_par_cette_subventio?=
 =?utf-8?b?biA/?=
To: Recipients <skamei@hikari-net.co.jp>
From: Mr Tom Huddleston< skamei@hikari-net.co.jp>
Date: Sat, 09 Mar 2024 05:01:48 -0800
Message-Id: <20240309130156.ADFBAC15FE89@c15pes1g.mwprem.net>
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

