Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBD2262B82
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Sep 2020 11:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0EA6ED81;
	Wed,  9 Sep 2020 09:14:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 958 seconds by postgrey-1.36 at gabe;
 Wed, 09 Sep 2020 09:14:39 UTC
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537536ED78
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  9 Sep 2020 09:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
 bh=gq11du5H3tyllH+2RNM7KXt6S15HYxlPRrtheitGXJw=; b=TYosW+YIqVF7WhMs0uNixnaErf
 EzJFWlqmqQvqyGl+dHYeITtN2g6N1bon8Vrd6lknximn8UBqSsGHJCuduMmv6RpqcfX10vPB8/ESS
 01/mhmdCs6kINpuxdOXnHVwOCkrDPBM6kMeG0WyONRruqf2OokF0ZY00WEV8bgSpflub02cUhDFme
 rPZcxSAQg/SjTORtfongbxmE9HVhkEOuph6gt9UdcFnzrLZmwuivqI2NUKxMrRKHQ5gydz8T8Psfp
 pNZI358vuZ+Fdq/1ULGuiYsnLmh1ujGMAI8/9I7P9lcJr/LNKdMq/0VgJySAPoIKIuSRFYoTYXdr7
 uGNXxq5w==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www413.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kFvw7-0000gj-Kp; Wed, 09 Sep 2020 10:58:39 +0200
Received: from [2001:16b8:578f:7200:8cd3:a626:26b2:c4ed] (helo=linux.fritz.box)
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kFvw7-000K3V-G5; Wed, 09 Sep 2020 10:58:39 +0200
Message-ID: <65f0f6f8995ea6431b25d74fd6562f331f255317.camel@cyberus-technology.de>
Subject: Night Color not working in guests
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: intel-gvt-dev@lists.freedesktop.org
Date: Wed, 09 Sep 2020 10:58:38 +0200
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/25924/Tue Sep  8 15:42:12 2020)
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

Hello everyone,

we noticed that any of the Night Color modes in Gnome and KDE don't work in
guests when they run with vGPUs. This is pretty easy to reproduce: Pick a GNOME
or KDE Live CD and try to enable Night Color (KDE) or Night Light (GNOME).

This is a bit of a minor issue, but I wonder what would be missing to make this
work. Is there anything missing in Qemu or this is something that the mediator
needs to handle. Does anyone have an idea?

Thanks,
Julian

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
