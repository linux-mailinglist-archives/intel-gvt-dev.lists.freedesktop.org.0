Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE961E1237
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 25 May 2020 17:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C89C89852;
	Mon, 25 May 2020 15:59:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 1587 seconds by postgrey-1.36 at gabe;
 Mon, 25 May 2020 15:59:10 UTC
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557B089852
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 May 2020 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XR6JAV1pG5lsmy5WPsxCzRxb89nwFlXmt1eNI0Frjvw=; b=am2m7r077VXSWKHWeW1E5M7Hd
 POQL1gTBn09BwcNjAYk4PSAbN4+3Aj40YZbnS1+cDUnnH1zTSfEpoQnSVUTwPN79xkQwIFynnAV9z
 VPKRUIfw5X84AqGzf3eZhgXMcHzUqjCWS/doDPulryUyNoNlPtL4TJuvuJCS+SY75O5R0lAyP/3mb
 TcQcN2LbT7JAXEJk6cbQUBSdVf220c+C1FemB5m2jQlhKbyjFT3gE5hGLw1NorKz15Xbxvl7lJq82
 cZdm60zAstVfKDPxGeU11/5udbSeX3kViktjDcBMopFwmKhxEwt3aTQckzHhRKp6iHolt718Rpmxg
 PHQFRWorQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jdF5m-0007i3-62
 for intel-gvt-dev@lists.freedesktop.org; Mon, 25 May 2020 17:32:42 +0200
Received: from [2001:16b8:57d3:9c00:5b00:b66:2fc9:5430] (helo=linux.fritz.box)
 by sslproxy02.your-server.de with esmtpsa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jdF5l-0006AS-Vv
 for intel-gvt-dev@lists.freedesktop.org; Mon, 25 May 2020 17:32:42 +0200
Message-ID: <98f001ecef5644f945e36585ac04ba31093e6a2e.camel@cyberus-technology.de>
Subject: Semantics of dma_{map,pin,unmap}_guest_page
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: intel-gvt-dev@lists.freedesktop.org
Date: Mon, 25 May 2020 17:32:39 +0200
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.2/25823/Mon May 25 14:23:53 2020)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hello,

as you know we are writing a hypervisor backend for i915/gvt. We were wondering
about the semantics of dma_map_guest_page, dma_pin_guest_page, and
dma_unmap_guest_page from intel_gvt_ops.

My current understanding is this: Map creates a new DMA mapping with a reference
count of 1. Pin increases the reference count by one. Unmap decreases the
reference count by 1 and if it reaches zero, removes the DMA mapping. Pretty
straight forward.

I would also expect that after I call `intel_gvt_ops->vgpu_destroy`, all DMA
mappings are released by the mediator with the appropriate number of unmap
calls. This doesn't seem to be the case, as I see many DMA mappings that are
still alive after the vGPU is destroyed.

At this point, I'm a bit unsure what to do with these mappings, because they
might still be in use. So the options are to either free them (and risk memory
corruption) or keep them around leak memory.

Do I have a flaw in my assumptions or is it expected behavior to clean up some
mappings that still have a reference count >0 after the vGPU is destroyed?

Thanks,
Julian



_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
