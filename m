Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9AFhDXpiJmrQVgIAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 08 Jun 2026 08:34:34 +0200
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA07653276
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 08 Jun 2026 08:34:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=ignition-design.co.uk header.s=default header.b=3ADNXVyK;
	spf=pass (mail.lfdr.de: domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8CB10ED69;
	Mon,  8 Jun 2026 06:26:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 1391 seconds by postgrey-1.36 at gabe;
 Mon, 08 Jun 2026 06:26:19 UTC
Received: from server.ignition-design.co.uk (server.ignition-design.co.uk
 [212.227.125.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC0710ED69
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Jun 2026 06:26:19 +0000 (UTC)
Received: by server.ignition-design.co.uk (Postfix, from userid 10004)
 id F012592FFB; Mon,  8 Jun 2026 05:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ignition-design.co.uk; s=default; t=1780898295;
 bh=nUtLkeP/uWGxhKc4kNNIHLaa8aMHelF1/FPYMxB9nVQ=; h=To:Subject:From;
 b=3ADNXVyK/+4lRk0vtiQj4s8JPUqqRApylZQZcTCewR/sBMPJPBol/+zwA1oFQz0wJ
 sWuJHnb0jZmPshYL+K7NuBvTq0x1scqQ9WkRoQRrlO52lA9BUpWfu/WGCWKIgVhX/N
 mpWIUGEhaINvF6clQmhPfWDOM+E0gF4qvWbrloZM=
To: intel-gvt-dev@lists.freedesktop.org
Subject: Greetings,
Date: Mon, 8 Jun 2026 05:58:15 +0000
From: "Mr. Mateo Diego" <support@ignition-design.co.uk>
Message-ID: <63cb6275ff4b01cb4cccd1b66857bc19@ignition-design.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reply-To: mateodiego@instructor.net
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Rspamd-Action: add header
X-Spamd-Result: default: False [10.19 / 15.00];
	MSBL_EBL(7.50)[mateodiego@instructor.net:replyto];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	FROM_NAME_HAS_TITLE(1.00)[mr];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[instructor.net];
	DMARC_NA(0.00)[ignition-design.co.uk];
	RCVD_COUNT_THREE(0.00)[3];
	R_DKIM_PERMFAIL(0.00)[ignition-design.co.uk:s=default];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ignition-design.co.uk:~];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[support@ignition-design.co.uk,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[mateodiego@instructor.net];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,instructor.net:replyto,ignition-design.co.uk:from_mime,ignition-design.co.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAA07653276
X-Spam: Yes

Greetings,

Please do accept my apologies I do not wish to invade into your privacy, I had written last week without response, I mentioned to you about my late client, who bear the same surname with you, Since his death letters from his Bank where he made a deposit of ($12,100.000.00) before his death has been received, the bank has asked me to provide his next of kin or any of his relatives or the mentioned deposit will be confiscated. I have contacted you since you have the same surname as him.

Kindly respond for more details and procedures of the transaction.

Regards,
Mateo Diego

