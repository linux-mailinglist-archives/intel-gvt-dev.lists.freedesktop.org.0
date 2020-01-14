Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0536E13A39C
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Jan 2020 10:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DCF6E321;
	Tue, 14 Jan 2020 09:18:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3B96E321;
 Tue, 14 Jan 2020 09:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WK5mNxJmZlMfIlStInjtnW5+mJGwXwB5z2/WQVXG1Jc=; b=Ds/jQbXw8nbCbaPbNliOhbJDq
 KRbr0XuNT25GWjjXRRA5yAqh1Da7rGWcqlnnYvdFiAD8ygBETMN7VXlqYCXgf/wb0yOtP57s4o7pv
 Pb3K2Nb2vi1Guqqj/ZJrxwyALOCGwLp4wMfNpa3mtW9YX7qygiafQvbgD2bEuVGRZIpAyi5GBoFQg
 Z3lkknNFmrn9RvgdFJqr2RBBu6kuj41+RXps4G8qrJcU5gpOPyOWdkCvdswyMPnC7usamVnGubICq
 rEWIHGG7Tl/C6/XgqeuF+WXL9K0EeYt0CWsjciSD4oOwHucsDoXXnsjZMtR10U4YZmowdmrMJmPPi
 VVbeiAZSA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1irIKt-0005gj-4d; Tue, 14 Jan 2020 09:18:07 +0000
Date: Tue, 14 Jan 2020 01:18:07 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: [RFC PATCH 0/4] Support for out-of-tree hypervisor modules in
 i915/gvt
Message-ID: <20200114091807.GA12664@infradead.org>
References: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
 <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hang.yuan@intel.com, zhiyuan.lv@intel.com, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Jan 09, 2020 at 07:13:53PM +0200, Julian Stecklina wrote:
> These patch series removes the dependency of i915/gvt hypervisor
> backends on the driver internals of the i915 driver. Instead, we add a
> small public API that hypervisor backends can use.
> 
> This enables out-of-tree hypervisor backends for the Intel graphics
> virtualization and simplifies development. At the same time, it
> creates at least a bit of a barrier to including more i915 internals
> into kvmgt, which is nice in itself.

Err, hell no.  This is not how Linux kernel development works.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
