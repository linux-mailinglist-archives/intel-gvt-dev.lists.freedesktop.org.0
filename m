Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJZeLy4HcmmvZwAAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 22 Jan 2026 12:17:02 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A73C65D76
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 22 Jan 2026 12:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D7B10E02A;
	Thu, 22 Jan 2026 11:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ogfu.giize.com header.i=offices@ogfu.giize.com header.b="kGMt8Wx7";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Thu, 22 Jan 2026 11:07:22 UTC
Received: from mta0.ogfu.giize.com (mta0.ogfu.giize.com [193.104.58.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129A410E02A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Jan 2026 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=default; d=ogfu.giize.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=offices@ogfu.giize.com;
 bh=h0bR+C66FpJ7FUSjG8KIgXjgmVg=;
 b=kGMt8Wx78vlZJhKmDba29LhrdLwkx3S+n2dy7j/Qnhprnm/QLGRnE18pkBJytXhfMHhxefgkZcye
 GI6WR54W24qsRSwOU3C0RzgaUmW1ZXi7g9A78xsmJ53C8wygKkWzIZ0vx3OWHk+TvrGlt1vAmlNP
 Hf5ezMNsRfPZs8WCILM=
From: Asfour Crystal International <offices@ogfu.giize.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: RE: Urgent Request for Product Details
Date: 22 Jan 2026 02:57:17 -0800
Message-ID: <20260122025717.D7A59167489EEDAB@ogfu.giize.com>
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
Reply-To: sales@asfourcrystal.cam
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	FAKE_REPLY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ogfu.giize.com,reject];
	R_DKIM_ALLOW(-0.20)[ogfu.giize.com:s=default];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[sales@asfourcrystal.cam];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[offices@ogfu.giize.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ogfu.giize.com:+];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ogfu.giize.com:mid,ogfu.giize.com:dkim,asfourcrystal.cam:replyto,asfourcrystal.cam:email]
X-Rspamd-Queue-Id: 9A73C65D76
X-Rspamd-Action: no action

Good day,


We are in need of urgent supply and will like to know more about=20
the quality of your product and if possible favorable quotes.

Kindly send us your latest catalogs or brochures, including=20
product details, prices, payment terms, and delivery timelines,=20
to my email:sales@asfourcrystal.cam at your earliest=20
convenience.


Please treat this request as urgent and respond promptly.



Thank you


Amr Margret
Regional Sales Director / Purchase
Asfour Crystal International
