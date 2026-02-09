Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6McTKFeoiWk0AQUAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 09 Feb 2026 10:26:47 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3413E10D8BC
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 09 Feb 2026 10:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1640C10E134;
	Mon,  9 Feb 2026 09:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airn.giize.com header.i=program@airn.giize.com header.b="VyMl+NGF";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Mon, 09 Feb 2026 09:26:44 UTC
Received: from mta0.airn.giize.com (mta0.airn.giize.com [143.20.185.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4983E10E134
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  9 Feb 2026 09:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=default; d=airn.giize.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=program@airn.giize.com;
 bh=B4eg0hjXwIfin57gF8rsYZIlP9k=;
 b=VyMl+NGFEPZZW8U2vWdINBFm9LCs165XW7eFugi/H8Un5jsENYjL/6VcJMGrA7e0V7URAH4lh8Fi
 JCl9tvd1bfFZdjlEryi98nBTES/LdoiJAcPrJ1kClXLt6nEpu2G3VpgX3UV1Ck3VnsUuC+x5BPAP
 O3kd+eQ2SqNU3tPu388=
From: S.S. Lootah Trading <program@airn.giize.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: RE: Inquiry for Product Information
Date: 9 Feb 2026 01:16:40 -0800
Message-ID: <20260209011640.C9293E9019F765A1@airn.giize.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
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
Reply-To: sales@sslootah.cam
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	FAKE_REPLY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[airn.giize.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[airn.giize.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[airn.giize.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_REPLYTO(0.00)[sales@sslootah.cam];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[program@airn.giize.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[airn.giize.com:mid,airn.giize.com:dkim,sslootah.cam:replyto,sslootah.cam:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3413E10D8BC
X-Rspamd-Action: no action

Hi Sir,
Good day.

We are currently reviewing manufacturers for upcoming projects=20
and would like to request your latest product catalog or=20
brochure, including key specifications, pricing details, payment=20
terms, and estimated delivery timelines.

Kindly send the requested information to sales@sslootah.cam at=20
your earliest convenience.

Thank you for your time. We look forward to your response.

Best regards,

Mohamed El-Sayed
Head of Projects
S.S. Lootah Trading Building Material Division LLC
Dubai =E2=80=93 UAE
E: sales@sslootah.cam
M: +971 52 679 2040
