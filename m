Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13751E1D59
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 May 2020 10:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB346E10A;
	Tue, 26 May 2020 08:30:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FCD6E10A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 May 2020 08:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H7SiFtUYgggcL5/ywLzJO/bGgfA0clVgzqn8YpM5GN8=; b=OJ0sIjst1OxFrL/swfhT+iO60
 VVj4s90jRrgyFkO5xd10iVXwGfx0E2m13Cr2mUu90UnwERLicS7tLVrMZ0LWSmZ4zIE3baVNFpnQr
 Vp7F0I2OeSIw/NOmwThEyflQVJWVvvUiyqKZRxz9hiwxplXAfk+4mVHA+k7xvKOCkyXt6vzp2Isu0
 yI00Xhkir8EruTktXxUdW7lASRJ7N2BkQdQqL7gkBlnZEeN/zfhhIDAIm/WdxcrA+3PbdIov67iLG
 3UbDjbcNMN7OHbDlsNHt4IqqX73ueoYLH2M8Nj2ZKY1Kxg7u+cBwlAanTAy3lz3hzsgVxiV8jBRHT
 WVqabYM8Q==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jdUyr-00010Z-09; Tue, 26 May 2020 10:30:37 +0200
Received: from [2001:16b8:5730:6e00:5e60:c12d:6fd5:1814] (helo=linux.fritz.box)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jdUyq-000XmQ-Qi; Tue, 26 May 2020 10:30:36 +0200
Message-ID: <3bdc659d41ad00d7ab1bf981dd97c2bb34163d0f.camel@cyberus-technology.de>
Subject: Re: Semantics of dma_{map,pin,unmap}_guest_page
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Yan Zhao <yan.y.zhao@intel.com>
Date: Tue, 26 May 2020 10:30:36 +0200
In-Reply-To: <20200526081244.GB19560@joy-OptiPlex-7040>
References: <98f001ecef5644f945e36585ac04ba31093e6a2e.camel@cyberus-technology.de>
 <20200526060229.GA19560@joy-OptiPlex-7040>
 <3fef2ebc2506dd2bd71f5411033c2cfb1b1a00bd.camel@cyberus-technology.de>
 <20200526081244.GB19560@joy-OptiPlex-7040>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 2020-05-26 at 04:12 -0400, Yan Zhao wrote:
> On Tue, May 26, 2020 at 10:11:12AM +0200, Julian Stecklina wrote:
> > On Tue, 2020-05-26 at 02:02 -0400, Yan Zhao wrote:
> > > as the Unmap calls are triggered from guest page table modification, its
> > > count does not necessarily match to that of Map calls.
> > > But unpon vGPU is destroyed, gvt_cache_destroy() would be called by
> > > kvmgt_guest_exit() and would remove all DMA mappings which might be still
> > > alive regardless of its ref count.
> > 
> > If page tables stay pinned across a call to vgpu_destroy, that would explain
> > what I'm seeing. This is then also harmless. I was worried that we
> > accumulate
> > these pins over time.
> > 
> > That being said, I've opened an issue in our internal bug tracker to re-
> > visit
> > this issue and confirm the theories.
> > 
> guest page tables are not necessarily cleared before vgpu_destroy,
> especially when guest is killed or crashed.
> so Unmap count is always less than Map count. I don't think it's a bug,
> and it's safe to clear all dma mappings generated for guest and unpin all
> previously pinned guest pages as now guest is destroyed. isn't it?

It's fine. It was just a bit surprising to me.

As I said before, it would be easier to spot bugs if vgpu_destroy would clean
DMA mappings up that it knows about, but it's mostly cosmetic.

Thanks,
Julian

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
