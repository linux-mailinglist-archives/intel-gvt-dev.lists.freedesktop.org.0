Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED355818D6
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 Jul 2022 19:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3070295F8F;
	Tue, 26 Jul 2022 17:48:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEE496117
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 Jul 2022 17:48:21 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C193D68AA6; Tue, 26 Jul 2022 19:48:17 +0200 (CEST)
Date: Tue, 26 Jul 2022 19:48:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [RFC PATCH] vfio/ccw: Move mdev stuff out of struct subchannel
Message-ID: <20220726174817.GB14002@lst.de>
References: <20220720050629.GA6076@lst.de>
 <20220726153725.2573294-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726153725.2573294-1-farman@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, mjrosato@linux.ibm.com,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org, kwankhede@nvidia.com,
 vneethv@linux.ibm.com, pasic@linux.ibm.com, alex.williamson@redhat.com,
 zhenyuw@linux.intel.com, jgg@nvidia.com, intel-gvt-dev@lists.freedesktop.org,
 hch@lst.de, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Jul 26, 2022 at 05:37:25PM +0200, Eric Farman wrote:
> Here's my swipe at a cleanup patch that can be folded in
> to this series, to get the mdev stuff in a more proper
> location for vfio-ccw.
> 
> As previously described, the subchannel is a device-agnostic
> structure that does/should not need to know about specific
> nuances such as mediated devices. This is why things like
> struct vfio_ccw_private exist, so move these details there.

Should I resend the series with that folded in?  At this point we're
probably not talking about 5.20 anyway.
