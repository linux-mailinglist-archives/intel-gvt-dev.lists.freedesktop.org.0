Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E90813CDBB
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Jan 2020 21:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B1E6EA90;
	Wed, 15 Jan 2020 20:06:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014646EA90
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jan 2020 20:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579118814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ouETeL4IvzIbfGB9Fv8qtP6i/4HZznlTaT1Dbkur2g8=;
 b=BR3QDKZ4vGb0G79avssm4n9uzKTcjp0FqB6mICd+27iKD0N31PpfifbpbYzGuHOlrX3Z7k
 CUJVr72vt0pcSmFY0VRg5ui6i3QRkY14FT1PHTJcw3d08MRm3Am48HCk66hKzb+iyJ2xIN
 oUaGyN5osk6YqMLMdjrUbROnVZk54qw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-Y5nQ-SI0N2iGLdeInMhekQ-1; Wed, 15 Jan 2020 15:06:53 -0500
X-MC-Unique: Y5nQ-SI0N2iGLdeInMhekQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FAD01005510;
 Wed, 15 Jan 2020 20:06:52 +0000 (UTC)
Received: from w520.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BD99675AF;
 Wed, 15 Jan 2020 20:06:51 +0000 (UTC)
Date: Wed, 15 Jan 2020 13:06:51 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915/gvt: subsitute kvm_read/write_guest
 with vfio_dma_rw
Message-ID: <20200115130651.29d7e9e0@w520.home>
In-Reply-To: <20200115035455.12417-1-yan.y.zhao@intel.com>
References: <20200115034132.2753-1-yan.y.zhao@intel.com>
 <20200115035455.12417-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: kevin.tian@intel.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhenyuw@linux.intel.com, peterx@redhat.com, pbonzini@redhat.com,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 14 Jan 2020 22:54:55 -0500
Yan Zhao <yan.y.zhao@intel.com> wrote:

> As a device model, it is better to read/write guest memory using vfio
> interface, so that vfio is able to maintain dirty info of device IOVAs.
> 
> Compared to kvm interfaces kvm_read/write_guest(), vfio_dma_rw() has ~600
> cycles more overhead on average.
> 
> -------------------------------------
> |    interface     | avg cpu cycles |
> |-----------------------------------|
> | kvm_write_guest  |     1554       |
> | ----------------------------------|
> | kvm_read_guest   |     707        |
> |-----------------------------------|
> | vfio_dma_rw(w)   |     2274       |
> |-----------------------------------|
> | vfio_dma_rw(r)   |     1378       |
> -------------------------------------

In v1 you had:

-------------------------------------
|    interface     | avg cpu cycles |
|-----------------------------------|
| kvm_write_guest  |     1546       |
| ----------------------------------|
| kvm_read_guest   |     686        |
|-----------------------------------|
| vfio_iova_rw(w)  |     2233       |
|-----------------------------------|
| vfio_iova_rw(r)  |     1262       |
-------------------------------------

So the kvm numbers remained within +0.5-3% while the vfio numbers are
now +1.8-9.2%.  I would have expected the algorithm change to at least
not be worse for small accesses and be better for accesses crossing
page boundaries.  Do you know what happened?
 
> Comparison of benchmarks scores are as blow:
> ------------------------------------------------------
> |  avg score  | kvm_read/write_guest  | vfio_dma_rw  |
> |----------------------------------------------------|
> |   Glmark2   |         1284          |    1296      |
> |----------------------------------------------------|
> |  Lightsmark |         61.24         |    61.27     |
> |----------------------------------------------------|
> |  OpenArena  |         140.9         |    137.4     |
> |----------------------------------------------------|
> |   Heaven    |          671          |     670      |
> ------------------------------------------------------
> No obvious performance downgrade found.
> 
> Cc: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index bd79a9718cc7..17edc9a7ff05 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1966,31 +1966,19 @@ static int kvmgt_rw_gpa(unsigned long handle, unsigned long gpa,
>  			void *buf, unsigned long len, bool write)
>  {
>  	struct kvmgt_guest_info *info;
> -	struct kvm *kvm;
> -	int idx, ret;
> -	bool kthread = current->mm == NULL;
> +	int ret;
> +	struct intel_vgpu *vgpu;
> +	struct device *dev;
>  
>  	if (!handle_valid(handle))
>  		return -ESRCH;
>  
>  	info = (struct kvmgt_guest_info *)handle;
> -	kvm = info->kvm;
> -
> -	if (kthread) {
> -		if (!mmget_not_zero(kvm->mm))
> -			return -EFAULT;
> -		use_mm(kvm->mm);
> -	}
> -
> -	idx = srcu_read_lock(&kvm->srcu);
> -	ret = write ? kvm_write_guest(kvm, gpa, buf, len) :
> -		      kvm_read_guest(kvm, gpa, buf, len);
> -	srcu_read_unlock(&kvm->srcu, idx);
> +	vgpu = info->vgpu;
> +	dev = mdev_dev(vgpu->vdev.mdev);
>  
> -	if (kthread) {
> -		unuse_mm(kvm->mm);
> -		mmput(kvm->mm);
> -	}
> +	ret = write ? vfio_dma_rw(dev, gpa, buf, len, true) :
> +			vfio_dma_rw(dev, gpa, buf, len, false);

As Paolo suggested previously, this can be simplified:

ret = vfio_dma_rw(dev, gpa, buf, len, write);

>  
>  	return ret;

Or even more simple, remove the ret variable:

return vfio_dma_rw(dev, gpa, buf, len, write);

Thanks,
Alex

>  }

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
