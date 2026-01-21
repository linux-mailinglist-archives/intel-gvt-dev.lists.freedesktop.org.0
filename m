Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLm0DoGWcGlyYgAAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jan 2026 10:04:01 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA020540A4
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jan 2026 10:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A5410E71E;
	Wed, 21 Jan 2026 09:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=vexro.pl header.i=@vexro.pl header.b="B5LU/Sm1";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 547 seconds by postgrey-1.36 at gabe;
 Wed, 21 Jan 2026 09:03:58 UTC
Received: from mail.vexro.pl (mail.vexro.pl [141.94.250.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1786C10E71A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 21 Jan 2026 09:03:58 +0000 (UTC)
Received: by mail.vexro.pl (Postfix, from userid 1002)
 id E42FFA8150; Wed, 21 Jan 2026 09:51:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
 t=1768985564; bh=Q8rYVmzeb0BIhBpMFUreKtfVcFEbEBQ1myveAe1Z1DY=;
 h=Date:From:To:Subject:From;
 b=B5LU/Sm1zipqPR0FNWgvwAqiMKVBlx5q0mZcS2LInGFi0YRaY07woiBxxO8UIsB3G
 HpcOO9GqQkOeQrsClO44YOdeZuln2GlKs5Qk914oJq6cl/9CnRMS/asGoiBWZJpTLL
 NLNg+f8vF4Sj08xlWOCQgVYb/WvIvO/6jwmcqtCiZypKvkQeKTuASnobeo0J4gI/z6
 axdAP7nuQmBZP1uYlTRmYk2Qr6Hgfo7QWDUHzN3924fdO7VI9rFWh6EofaCCnBosbq
 kdZOa3KyoC1O0yACr8RUSHJDz52xCnno77sPZjVnwSTUXFobbf3+pbAgHW5KMT6lJa
 T24kq/PHlTWsQ==
Received: by mail.vexro.pl for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 21 Jan 2026 08:50:47 GMT
Message-ID: <20260121084500-0.1.pt.4yudh.0.opwvz5e3rq@vexro.pl>
Date: Wed, 21 Jan 2026 08:50:47 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <intel-gvt-dev@lists.freedesktop.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [-0.80 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[vexro.pl,reject];
	SUBJECT_ENDS_SPACES(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[vexro.pl:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,vexro.pl:mid,vexro.pl:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adam.drzewiecki@vexro.pl,intel-gvt-dev-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	DKIM_TRACE(0.00)[vexro.pl:+]
X-Rspamd-Queue-Id: BA020540A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Szanowni Pa=C5=84stwo,

zajmujemy si=C4=99 wdra=C5=BCaniem systemu, kt=C3=B3ry zapewnia pe=C5=82n=
y nadz=C3=B3r nad pojazdami w czasie rzeczywistym, usprawnia planowanie t=
ras i redukuje koszty operacyjne.

Platforma automatycznie generuje raporty, wysy=C5=82a powiadomienia o sta=
nie technicznym aut i dostarcza danych wspieraj=C4=85cych decyzje zarz=C4=
=85dcze.

Czy byliby Pa=C5=84stwo zainteresowani kr=C3=B3tk=C4=85 prezentacj=C4=85 =
lub bezp=C5=82atnym testem systemu?


Pozdrawiam
Adam Drzewiecki
