Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1449856A3D2
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  7 Jul 2022 15:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E5B14AED2;
	Thu,  7 Jul 2022 13:38:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8088614AD0B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  7 Jul 2022 13:38:04 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DCD8768AA6; Thu,  7 Jul 2022 15:37:59 +0200 (CEST)
Date: Thu, 7 Jul 2022 15:37:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH 15/15] vfio/mdev: remove an extra parent kobject reference
Message-ID: <20220707133759.GA19060@lst.de>
References: <20220706074219.3614-1-hch@lst.de>
 <20220706074219.3614-16-hch@lst.de>
 <c967d315-755c-a7ef-569e-9aa25c65d261@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c967d315-755c-a7ef-569e-9aa25c65d261@nvidia.com>
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
 linux-s390@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Tarun Gupta <targupta@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Shounak Deshpande <shdeshpande@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Jul 06, 2022 at 07:18:48PM +0530, Kirti Wankhede wrote:
>> -		kobject_put(&type->kobj);
>
> This kobject_put is required here in error case, see description above 
> kobject_init_and_add().

And they are completely unrelated anyway, this should have never slipped
in.
