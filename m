Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622325EEE89
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 29 Sep 2022 09:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1437F10E973;
	Thu, 29 Sep 2022 07:11:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9786210E973
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 29 Sep 2022 07:11:21 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F33C168BFE; Thu, 29 Sep 2022 09:11:17 +0200 (CEST)
Date: Thu, 29 Sep 2022 09:11:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: simplify the mdev interface v8
Message-ID: <20220929071117.GA32553@lst.de>
References: <20220923092652.100656-1-hch@lst.de>
 <20220927140737.0b4c9a54.alex.williamson@redhat.com>
 <20220927155426.23f4b8e9.alex.williamson@redhat.com>
 <20220928121110.GA30738@lst.de>
 <20220928125650.0a2ea297.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928125650.0a2ea297.alex.williamson@redhat.com>
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
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 12:56:50PM -0600, Alex Williamson wrote:
> That fixes the crash, but available_instances isn't working:

I see the same behavior both with and without my series.  Given that
the code to report it didn't change that is also very much expected.

So something in i915 fails to update the resources when deleting
instances, but it is an existing issue.
