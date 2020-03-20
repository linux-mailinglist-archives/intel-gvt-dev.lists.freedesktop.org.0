Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63B418CAAD
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 20 Mar 2020 10:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA4C6EAFB;
	Fri, 20 Mar 2020 09:49:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3D56EAFB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 20 Mar 2020 09:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jy3OiIBXFra5OSUTY8XK09GOX0a3dqqOoAyqE1simYk=; b=O+tr3UzHLRSS3mnSmC7ML1rI0
 7tj6nmt7H2sp/IHEJJYwu4z454jX/riAGQs533Ddzo0/3OSV+wGZ7kUun3lHtvPNVSEwKGGgXqPSR
 PJm0IccchwT9jbMCkeHZJHJ8T7L39iAqZjF9K58QSWBWx3NEb3ZOPQzs0PoOKYP2g17TF+4mcsxuj
 wdUrR8FguS8swzgDkEaYZ5C857iXsb0qfLzufgObNynHEeb4NYM5oLwawuJPEooPCaDJYsSyb0kyK
 n7kTw/1xhuoZMnM3zkkMleOI/ujU7SKWVDG05+wTPWDIoBUVjZu7ym3jMOGmxnpociD/AYxTaKnq3
 mA/FEmUpw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jFEHT-00068e-4f; Fri, 20 Mar 2020 10:49:31 +0100
Received: from [2001:16b8:572b:ce00:372e:184c:c2cf:7b1f] (helo=linux.fritz.box)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jFEHS-0006f0-U5; Fri, 20 Mar 2020 10:49:31 +0100
Message-ID: <d1dfb5c753abf0aa9eb2b9a1b2c7ae01e967373e.camel@cyberus-technology.de>
Subject: Multi-monitor support
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Intel GVT Dev <intel-gvt-dev@lists.freedesktop.org>
Date: Fri, 20 Mar 2020 10:49:29 +0100
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.2/25756/Thu Mar 19 14:11:06 2020)
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
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi everyone,

We were wondering what would be required to enable monitor support with GVT.
Does this only require plumbing for the guest to realize that there are multiple
outputs or is there something more fundamental missing in the mediator?

Thanks,
Julian

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
