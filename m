Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DBAACA938
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  2 Jun 2025 08:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFEC10E139;
	Mon,  2 Jun 2025 06:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=soul2soul.ro header.i=@soul2soul.ro header.b="gsJPgJy4";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 113274 seconds by postgrey-1.36 at gabe;
 Mon, 02 Jun 2025 06:05:35 UTC
Received: from lg.as6663.net (lg.as6663.net [89.238.206.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F65010E139
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  2 Jun 2025 06:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=soul2soul.ro; s=default; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BbMZHNRc2Mb1emLJB20ZtaiuzyVPoo0RBK/cceCt4VQ=; b=gsJPgJy4l5EdX3lBmOaw1T7ORx
 Ehe/9J659X1LcJ+sRqMO2z10HGd/YYEOIOOVnhbkVk5HRBrrMwxLQsS+cPBFaE7dqu4h+8djeqjuz
 aoiMu4QCLG/eocoSc+sKW/KdmHhomvd9UJ+X2VRHeGjy2uCzr3AaU76zENKDK9to35Mlcfh+lca/9
 X/fUXyQbBZg6+PPkgC9gm+/IgOtSsvv/+an4/WElrSJ4mmimfzjQEqH0GLT/dHzixWM7nO2HWqK2o
 uwYwBkljDkYv1uYxvFumTqTLqT3u8MDMNB9UFOAClfgNmOW/QmYErhYpnUOnas988bFPT3uk4OumS
 jyDLz1ww==;
Received: from [109.248.151.17] (port=57132)
 by cpanel2.euroweb.ro with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <jchavez@lanrosh.com>) id 1uKJB6-00000005zL9-1upD
 for intel-gvt-dev@lists.freedesktop.org;
 Wed, 28 May 2025 18:59:04 +0300
From: Dr.Allen Cheng <jchavez@lanrosh.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: RE: CORRESPONDENCE
Date: 28 May 2025 16:59:07 +0100
Message-ID: <20250528165907.2DDB2AF2EC48E340@lanrosh.com>
MIME-Version: 1.0
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel2.euroweb.ro
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lanrosh.com
X-Get-Message-Sender-Via: cpanel2.euroweb.ro: authenticated_id:
 nicusor.ionescu@soul2soul.ro
X-Authenticated-Sender: cpanel2.euroweb.ro: nicusor.ionescu@soul2soul.ro
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Reply-To: "Dr.Allen Cheng" <allencheng0157@gmail.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.4em;">
<p>Hello intel-gvt-dev,</p><p>I sent you a message a few hours ago but I ha=
ven't gotten a response yet, or you didn't get it? I would like to know if =
any concerns have prevented you from responding. Could you read my letter a=
nd reply? I want to make an inquiry</p><p>Thanks.</p><p>Dr.Allen Cheng</p><=
p>Research Assistant &amp; Dermatologist<br>First Gapore Industries LTD</p>=
<p></p><p></p>


</body></html>
