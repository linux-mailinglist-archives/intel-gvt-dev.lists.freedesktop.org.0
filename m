Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2AF56B267
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  8 Jul 2022 07:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F18A10E527;
	Fri,  8 Jul 2022 05:48:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C92210E527
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Jul 2022 05:48:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3E3A867373; Fri,  8 Jul 2022 07:48:37 +0200 (CEST)
Date: Fri, 8 Jul 2022 07:48:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH 14/15] vfio/mdev: add mdev available instance checking
 to the core
Message-ID: <20220708054836.GA16300@lst.de>
References: <20220706074219.3614-1-hch@lst.de>
 <20220706074219.3614-15-hch@lst.de>
 <488e7a98426dc64a53864ca302f7c32627a070fd.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <488e7a98426dc64a53864ca302f7c32627a070fd.camel@linux.ibm.com>
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
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Jul 06, 2022 at 11:08:57PM -0400, Eric Farman wrote:
> If I read this right, .get_available and .max_instances are mutually
> exclusive.

Yes.

> Which means that available_instances_show() from patch 12
> would need to emit parent->available_instances if .get_available is
> NULL.

Indeed.
