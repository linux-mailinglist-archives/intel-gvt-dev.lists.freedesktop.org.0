Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E730B18CBF9
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 20 Mar 2020 11:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992006EB02;
	Fri, 20 Mar 2020 10:49:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0FF6EB02
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 20 Mar 2020 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eRPmha4ah9t2wcA33OLK6XhzTcJRMzN/1al8a4m0XMk=; b=jkoBZ/i+aESK73EcNVFx9wgvS
 Rst7/LPW8xpR0IXdO0/OXZK6i+yu25QSdolLEpHs2S0eoRzj+XkPAzEX+CG3PcdmUYHk8FUxBw+0G
 JeNI/c5kh+3RCqyXwbrAwTrQZ/o3rqNIOG5cgnrrBO7eHbNVSbXHF2gGH0OkALdFFqbASIs4Xqj+h
 x0d7OQ8qDdnr2gu3sFUoBZrfXyhUDNzKB5oo64Lnw05S9dLpS5Bnj84CCYZrZ6knvxwKdkZ7/RaZr
 aiKn+ePYnkHVM5Glnm3QR5kne/KXlWPeboAiMrsU/yqW782DryAzQ/7qPloK6mM8UCZNZimiYqMzE
 KebxmQ2VQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jFFDn-0000eU-4F; Fri, 20 Mar 2020 11:49:47 +0100
Received: from [2001:16b8:572b:ce00:372e:184c:c2cf:7b1f] (helo=linux.fritz.box)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jFFDm-000UMW-Uk; Fri, 20 Mar 2020 11:49:47 +0100
Message-ID: <460869e24c55da66c43e3cbdf77b4af5f9a0bbeb.camel@cyberus-technology.de>
Subject: GVT State Save/Restore
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Intel GVT Dev <intel-gvt-dev@lists.freedesktop.org>
Date: Fri, 20 Mar 2020 11:49:46 +0100
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

I'm researching what needs to be done to enable VMs with a GVT device to be
saved to disk and restored. This is similar to live migration in the sense that
state of the vGPU needs to be serialized and deserialized, but simpler, because
no dirty page tracking is needed.

I've seen work and discussions towards full live migration support:
- https://www.spinics.net/lists/kvm/msg195198.html
- https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg09242.html
- 
https://events17.linuxfoundation.org/sites/events/files/slides/Live%20migration%20with%20mdev%20device%20-%202017_0.pdf

It doesn't seem like any of the patches actually made it upstream. Are there
some newer PoC patches to look at or did I miss some functionality in the
mediator?

Any info is appreciated!

Thanks,
Julian

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
