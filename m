Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409BF54A8D8
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Jun 2022 07:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABE610FED0;
	Tue, 14 Jun 2022 05:44:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867F610FD96
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Jun 2022 05:44:35 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E0AA768AA6; Tue, 14 Jun 2022 07:44:31 +0200 (CEST)
Date: Tue, 14 Jun 2022 07:44:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: simplify the mdev interface v2
Message-ID: <20220614054431.GA30824@lst.de>
References: <20220614045428.278494-1-hch@lst.de>
 <0e517684-8b10-5410-8ad0-df7caed860b7@intel.com>
 <20220614051723.GA30556@lst.de>
 <168474bd-579e-a895-31e2-00d855d718de@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168474bd-579e-a895-31e2-00d855d718de@intel.com>
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
 Alex Williamson <alex.williamson@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Jun 14, 2022 at 01:30:06PM +0800, Yi Liu wrote:
> On 2022/6/14 13:17, Christoph Hellwig wrote:
>> On Tue, Jun 14, 2022 at 01:03:55PM +0800, Yi Liu wrote:
>>> Is this series available on any github repo? I'd like to apply your series
>>> and apply my vfio_device cdev series on top of it.
>>
>> I have a git repository available, but nothing on crappy platforms like
>> github.
>
> haha, could you share me your git repo? :-)

git://git.infradead.org/users/hch/misc.git mdev-lifetime

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/mdev-lifetime
