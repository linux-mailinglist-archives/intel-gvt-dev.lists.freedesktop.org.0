Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF19E57A233
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Jul 2022 16:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B1B8AE47;
	Tue, 19 Jul 2022 14:49:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1748A8AE3F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Jul 2022 14:49:31 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 561FC68AFE; Tue, 19 Jul 2022 16:49:28 +0200 (CEST)
Date: Tue, 19 Jul 2022 16:49:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: simplify the mdev interface v6
Message-ID: <20220719144928.GB21431@lst.de>
References: <20220709045450.609884-1-hch@lst.de>
 <20220718054348.GA22345@lst.de>
 <20220718153331.18a52e31.alex.williamson@redhat.com>
 <1f945ef0eb6c02079700a6785ca3dd9864096b82.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f945ef0eb6c02079700a6785ca3dd9864096b82.camel@linux.ibm.com>
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 kvm@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 linux-s390@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Jul 18, 2022 at 10:01:40PM -0400, Eric Farman wrote:
> I'll get the problem with struct subchannel [1] sorted out in the next
> couple of days. This series breaks vfio-ccw in its current form (see
> reply to patch 14), but even with that addressed the placement of all
> these other mdev structs needs to be handled differently.

Alex, any preference if I should just fix the number instances checking
with either an incremental patch or a resend, or wait for this ccw
rework?
