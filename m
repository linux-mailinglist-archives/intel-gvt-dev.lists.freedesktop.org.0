Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1739953C4FE
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Jun 2022 08:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80C4113D29;
	Fri,  3 Jun 2022 06:36:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64267113D29
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  3 Jun 2022 06:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0gN/O2qqFG9+DfzkqIoNq9u9eFv5IpvHk8XoCZp1rOE=; b=SQimyw27hv4kngBGdjVQYAKvSg
 WdwqAsaCkNSm2J0BpHUE3DAEdByq2ALQ9dTazgpkWBCGgULTXcPZ0vn+ByxTF87Qqgq+pHvr7z3+R
 fnDfCyPvRZ8B8qYRsqYGTkTKuw01bM/4NK1Mq2gsPKnGrz4flPfCllP219BFFym5T9CHUUXJwY5Fh
 rX8qWTQHTuXD6ZZis7DVRpxwwpPV/EgMPND34wWO2qoInVIJm+ts1G5iEmmT3A3UQ8gdfF262RzCS
 IirmLEDl5vAzHzoyCLXkJCKDMnsRNPZh+FzToaUhm4sSdsygQ3nIfREE/VCpX2BtA0qkaninHbCZF
 aTwXbrfg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nx0ur-0061h9-CZ; Fri, 03 Jun 2022 06:36:13 +0000
Date: Thu, 2 Jun 2022 23:36:13 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v1 13/18] vfio/mdev: Consolidate all the device_api sysfs
 into the core code
Message-ID: <Ypmr3TvgHXIfsyBf@infradead.org>
References: <20220602171948.2790690-1-farman@linux.ibm.com>
 <20220602171948.2790690-14-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602171948.2790690-14-farman@linux.ibm.com>
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, linux-s390@vger.kernel.org,
 Liu Yi L <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Kirti Wankhede <kwankhede@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Jun 02, 2022 at 07:19:43PM +0200, Eric Farman wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> Every driver just emits a static string, simply feed it through the ops
> and provide a standard sysfs show function.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
