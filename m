Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23755550929
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 19 Jun 2022 09:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1908C10E2C8;
	Sun, 19 Jun 2022 07:37:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC8610E2C8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 19 Jun 2022 07:37:52 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 875EB67373; Sun, 19 Jun 2022 09:37:48 +0200 (CEST)
Date: Sun, 19 Jun 2022 09:37:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH 04/13] vfio/mdev: remove mdev_{create,remove}_sysfs_files
Message-ID: <20220619073748.GA27820@lst.de>
References: <20220614045428.278494-1-hch@lst.de>
 <20220614045428.278494-5-hch@lst.de>
 <fdfd02cf-07be-1cfd-85ca-ae2dbd8a8d84@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdfd02cf-07be-1cfd-85ca-ae2dbd8a8d84@nvidia.com>
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
 Eric Farman <farman@linux.ibm.com>, Neo Jia <cjia@nvidia.com>,
 kvm@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 linux-s390@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Tarun Gupta <targupta@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>, Dheeraj Nigam <dnigam@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Jun 16, 2022 at 01:33:30AM +0530, Kirti Wankhede wrote:
>
> Does this change really required? When mdev was implemented we tried to 
> keep all sysfs related stuff in mdev_sysfs.c file and I would still like to 
> stick to that approach.

It isn't strictly required, but it removes a lot of pointless boilerplate
code.
